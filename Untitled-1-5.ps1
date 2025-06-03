# --- Apply Force Push vers Firebase ou autre API REST ---

Add-Type -AssemblyName System.Windows.Forms

# Sélection du fichier lourd
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.InitialDirectory = [Environment]::GetFolderPath("Desktop")
$openFileDialog.Filter = "Tous les fichiers (*.*)|*.*"
$null = $openFileDialog.ShowDialog()
$filePath = $openFileDialog.FileName

if (-not (Test-Path $filePath)) {
    Write-Host "Aucun fichier sélectionné. Annulation."
    exit
}

# Lecture et conversion du fichier en base64
$base64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($filePath))
$fileName = [IO.Path]::GetFileName($filePath)
$timestamp = [int][double]::Parse((Get-Date -UFormat %s))

# Construction JSON pour push
$payload = @{
    fileName = $fileName
    base64Content = $base64
    timestamp = $timestamp
} | ConvertTo-Json -Depth 3

# API cible (à modifier selon ton hébergement)
$apiURL = "http://localhost:3100/deploy-heavy-element"  # ou ton API Firebase, etc.

# Envoi via POST
$response = Invoke-RestMethod -Uri $apiURL -Method POST -Body $payload -ContentType "application/json"

# Affichage du résultat
Write-Host "Push terminé : $($response.status)"
Write-Host "Chemin sur serveur : $($response.chemin)"

