@echo off
setlocal ENABLEDELAYEDEXPANSION

:: === CONFIGURATION ===
set "NODE_PATH=node"
set "SERVER_HOST=localhost"
set "SERVER_PORT=3000"
set "TOKEN=token-client-123"
set "CLIENT_ID=client-%RANDOM%"
set "PUSH_FILE=push_client_input.txt"
set "WATCH_FOLDER=C:\ScriptsToAnalyze"
set "TMP_JSON_FILE=push_payload.json"

:: === CRÉATION DU FICHIER POUR PUSH DANS NOTEPAD ===
if not exist %PUSH_FILE% (
    echo Entrez votre texte ici pour push. Sauvegardez pour déclencher. > %PUSH_FILE%
)

start notepad %PUSH_FILE%

:: === OBSERVATEUR DE FICHIERS ET DÉCLENCHEUR DE PUSH ===
powershell -Command "
$prev = Get-Content '%PUSH_FILE%' -Raw
while ($true) {
    Start-Sleep -Seconds 2
    $curr = Get-Content '%PUSH_FILE%' -Raw
    if ($curr -ne $prev) {
        $prev = $curr
        $json = @{ 
            content = $curr; 
            client = '%CLIENT_ID%';
            timestamp = [DateTimeOffset]::Now.ToUnixTimeMilliseconds(); 
            multitask = 'yes';
            status = 'changed'
        } | ConvertTo-Json -Depth 3
        $json | Out-File -Encoding utf8 '%TMP_JSON_FILE%'
        Invoke-WebRequest -Uri http://%SERVER_HOST%:%SERVER_PORT%/push-client -Method POST -InFile '%TMP_JSON_FILE%' -ContentType 'application/json'
    }
}
"

:: === SCAN EXECUTABLES SANS LES OUVRIR ===
echo [INFO] Analyse automatique des exécutables dans %WATCH_FOLDER%
powershell -Command "
$files = Get-ChildItem -Path '%WATCH_FOLDER%' -Include *.exe,*.bat,*.ps1 -Recurse
foreach ($f in $files) {
    $meta = @{
        filename = $f.Name;
        fullPath = $f.FullName;
        extension = $f.Extension;
        sizeKB = [math]::Round($f.Length / 1KB, 2);
        lastModified = $f.LastWriteTime;
        client = '%CLIENT_ID%';
        timestamp = [DateTimeOffset]::Now.ToUnixTimeMilliseconds();
        category = 'executable';
        detected = 'auto';
    } | ConvertTo-Json -Depth 3
    $meta | Out-File -Encoding utf8 '%TMP_JSON_FILE%'
    Invoke-WebRequest -Uri http://%SERVER_HOST%:%SERVER_PORT%/push-client -Method POST -InFile '%TMP_JSON_FILE%' -ContentType 'application/json'
}
"

exit
