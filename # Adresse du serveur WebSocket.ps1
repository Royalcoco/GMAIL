# Adresse du serveur WebSocket
$serverUrl = "ws://localhost:[x]"

# Création de l'objet WebSocket Client
Add-Type -AssemblyName System.Net.WebSockets.Client

$client = [System.Net.WebSockets.ClientWebSocket]::new()

# Fonction async pour envoyer un message JSON
function Send-WebSocketMessage {
    param (
        [System.Net.WebSockets.ClientWebSocket]$ws,
        [string]$message
    )
    $buffer = [System.Text.Encoding]::UTF8.GetBytes($message)
    $segment = New-Object System.ArraySegment[byte] ($buffer)
    $ws.SendAsync($segment, [System.Net.WebSockets.WebSocketMessageType]::Text, $true, [Threading.CancellationToken]::None) | Out-Null
}

# Fonction async pour recevoir un message JSON
function Receive-WebSocketMessage {
    param (
        [System.Net.WebSockets.ClientWebSocket]$ws
    )
    $buffer = New-Object Byte[] 1024
    $segment = New-Object System.ArraySegment[byte] ($buffer)
    $result = $ws.ReceiveAsync($segment, [Threading.CancellationToken]::None).Result
    $message = [System.Text.Encoding]::UTF8.GetString($buffer, 0, $result.Count)
    return $message
}

# Connexion au serveur WebSocket
$connectTask = $client.ConnectAsync([Uri] $serverUrl, [Threading.CancellationToken]::None)
$connectTask.Wait()

if ($client.State -eq 'Open') {
    Write-Host "Connecté au serveur WebSocket."

    # Préparation du message JSON avec token et contenu
    $jsonPayload = @{
        token = "token123"         # Doit correspondre au token valide sur serveur
        clientId = "client_powershell_01"
        content = "Données envoyées depuis PowerShell client"
        signal = @{
            base64 = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes("exemple de signal"))
            ports = @{
                inputs = 1
                outputs = 3
            }
        }
    } | ConvertTo-Json -Depth 5

    # Envoi du message
    Send-WebSocketMessage -ws $client -message $jsonPayload

    # Attente et affichage de la réponse serveur
    $response = Receive-WebSocketMessage -ws $client
    Write-Host "Réponse serveur:" $response

    # Fermeture de la connexion WebSocket
    $client.CloseAsync([System.Net.WebSockets.WebSocketCloseStatus]::NormalClosure, "Fin", [Threading.CancellationToken]::None).Wait()
} else {
    Write-Host "Impossible de se connecter au serveur WebSocket."
}
# Config
$watchFolder = "C:\push_queue"
$processedFolder = "$watchFolder\processed"
$serverUrl = "ws://localhost:3001"

# Création dossier processed s'il n'existe pas
if (-not (Test-Path $processedFolder)) {
    New-Item -ItemType Directory -Path $processedFolder | Out-Null
}

Add-Type -AssemblyName System.Net.WebSockets.Client

function Send-WebSocketMessage {
    param (
        [System.Net.WebSockets.ClientWebSocket]$ws,
        [string]$message
    )
    $buffer = [System.Text.Encoding]::UTF8.GetBytes($message)
    $segment = New-Object System.ArraySegment[byte] ($buffer)
    $ws.SendAsync($segment, [System.Net.WebSockets.WebSocketMessageType]::Text, $true, [Threading.CancellationToken]::None) | Out-Null
}

function Receive-WebSocketMessage {
    param (
        [System.Net.WebSockets.ClientWebSocket]$ws
    )
    $buffer = New-Object Byte[] 2048
    $segment = New-Object System.ArraySegment[byte] ($buffer)
    $result = $ws.ReceiveAsync($segment, [Threading.CancellationToken]::None).Result
    $message = [System.Text.Encoding]::UTF8.GetString($buffer, 0, $result.Count)
    return $message
}

function Push-FileToServer {
    param (
        [string]$filePath
    )
    $content = Get-Content -Raw -Path $filePath

    $client = [System.Net.WebSockets.ClientWebSocket]::new()
    $connectTask = $client.ConnectAsync([Uri] $serverUrl, [Threading.CancellationToken]::None)
    $connectTask.Wait()

    if ($client.State -eq 'Open') {
        Write-Host "Connecté au serveur WebSocket, envoi du fichier : $filePath"

        # On suppose que le fichier contient déjà un JSON valide à envoyer
        Send-WebSocketMessage -ws $client -message $content
        $response = Receive-WebSocketMessage -ws $client
        Write-Host "Réponse serveur: $response"

        $client.CloseAsync([System.Net.WebSockets.WebSocketCloseStatus]::NormalClosure, "Fin", [Threading.CancellationToken]::None).Wait()

        # Déplacement du fichier traité
        $dest = Join-Path $processedFolder (Split-Path $filePath -Leaf)
        Move-Item -Path $filePath -Destination $dest -Force
        Write-Host "Fichier déplacé vers processed : $dest"
    }
    else {
        Write-Host "Échec de la connexion au serveur WebSocket"
    }
}

# Surveillance dossier et boucle infinie
Write-Host "Surveillance du dossier $watchFolder pour nouveaux fichiers .json"

while ($true) {
    $files = Get-ChildItem -Path $watchFolder -Filter "*.json" -File
    foreach ($file in $files) {
        try {
            Push-FileToServer -filePath $file.FullName
        } catch {
            Write-Host "Erreur lors du push : $_"
        }
    }
    Start-Sleep -Seconds 5
}
$watchFolder = "C:\push_queue"

if (-not (Test-Path $watchFolder)) {
    New-Item -ItemType Directory -Path $watchFolder | Out-Null
}

function Generate-RandomPushJson {
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $authorIP = "192.168.0." + (Get-Random -Minimum 2 -Maximum 254)
    $randomContent = @"
{
  "author": "$authorIP",
  "timestamp": "$timestamp",
  "type": "no-code-ai-question",
  "content": "Test push automatique généré le $timestamp",
  "status": "pending",
  "executable": false
}
"@

    $fileName = "push_${timestamp}_${authorIP.Replace('.', '_')}.json"
    $filePath = Join-Path $watchFolder $fileName
    $randomContent | Out-File -FilePath $filePath -Encoding utf8
    Write-Host "Fichier généré : $fileName"
}

# Génère un nouveau fichier toutes les 10 secondes, par exemple 5 fois
for ($i=0; $i -lt 5; $i++) {
    Generate-RandomPushJson
    Start-Sleep -Seconds 10
}
const express = require('express');
const WebSocket = require('ws');
const fs = require('fs');
const os = require('os');
const path = require('path');

const app = express();
const PORT = 3000;
const WS_PORT = 3001;
const pushDir = path.resolve('./push_files');

if (!fs.existsSync(pushDir)) fs.mkdirSync(pushDir);

app.use(express.json());
app.use(express.static('public'));

function getLocalIP() {
  const nets = os.networkInterfaces();
  for (const name in nets) {
    for (const net of nets[name]) {
      if (net.family === 'IPv4' && !net.internal) return net.address;
    }
  }
  return '127.0.0.1';
}

function derivePortFromSignal(signalValue) {
  // Ex : Port de base 3001 + (signalValue mod 100)
  return 3001 + (signalValue % 100);
}

const wss = new WebSocket.Server({ port: WS_PORT });

wss.on('connection', ws => {
  ws.on('message', msg => {
    try {
      const data = JSON.parse(msg);
      const signal = data.signal || 0;
      const dynamicPort = derivePortFromSignal(signal);

      // Enregistrement du push
      const fileName = `push_${Date.now()}_${data.authorIP.replace(/\./g, '_')}.json`;
      const pushData = {
        ...data,
        receivedAt: Date.now(),
        dynamicPort,
        status: 'queued'
      };
      fs.writeFileSync(path.join(pushDir, fileName), JSON.stringify(pushData, null, 2));

      ws.send(JSON.stringify({ status: 'received', dynamicPort }));
    } catch(e) {
      ws.send(JSON.stringify({ status: 'error', message: e.message }));
    }
  });
});

app.get('/push-files', (req, res) => {
  const files = fs.readdirSync(pushDir);
  res.json(files);
});

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`HTTP server running on http://localhost:${PORT}`);
  console.log(`WebSocket server running on ws://localhost:${WS_PORT}`);
});
$wsServer = "ws://localhost:3001"

function Get-SimulatedDeviceInfo {
    return @{
        id = "device" + (Get-Random -Minimum 1 -Maximum 100)
        ip = "192.168.1." + (Get-Random -Minimum 2 -Maximum 254)
        signal = Get-Random -Minimum 100 -Maximum 999
    }
}

function Send-PushToServer($device) {
    $json = @{
        authorIP = $device.ip
        type = "no-code-ai-question"
        content = "Push automatique PowerShell pour $($device.id)"
        signal = $device.signal
    } | ConvertTo-Json

    # Utilisation de curl via Invoke-WebRequest (simulate WebSocket push via HTTP POST)
    $response = Invoke-RestMethod -Uri "http://localhost:3000/push-toolbar" -Method POST -Body $json -ContentType "application/json"
    Write-Host "Push envoyé pour $($device.id) : $($response.status)"
}

for ($i=0; $i -lt 3; $i++) {
    $device = Get-SimulatedDeviceInfo
    Write-Host "Simulation device $($device.id) avec IP $($device.ip) signal $($device.signal)"
    Send-PushToServer -device $device
    Start-Sleep -Seconds 5
}
# Exécution du script de surveillance
Start-Process powershell -ArgumentList "-NoExit", "-File", "C:\path\to\your\watch_script.ps1"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Firebase AI App</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css">
  <style>
    body {
      padding: 20px;
    }
    .container {
      max-width: 800px;
      margin: auto;
    }
    .message {
      margin-top: 20px;
    }
    .message p {
      margin: 0;
    }
    .message.is-success {
      background-color: #f0f9f4;
      border-color: #b2f5ea;
    }
    .message.is-danger {
      background-color: #fef2f2;
      border-color: #fecaca;
    }
    .message.is-info {
      background-color: #e0f2fe;
      border-color: #bfdbfe;
    }
    .message.is-warning {
      background-color: #fffbeb;
      border-color: #fef08a;
    }
    .message.is-primary {
      background-color: #eff6ff;
      border-color: #bfdbfe;
    }
    .message.is-link {
      background-color: #f0f9ff;
      border-color: #bfdbfe;
    }
    .message.is-light {
      background-color: #f8fafc;
      border-color: #e2e8f0;
    }
    .message.is-dark {
      background-color: #1f2937;
      border-color: #4b5563;
      color: white;
    }
    .message.is-black {
      background-color: #111827;
      border-color: #1f2937;
      color: white;
    }
    .message.is-white {
      background-color: #ffffff;
      border-color: #f3f4f6;
      color: black;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1 class="title">Firebase AI App</h1>
    <h2 class="subtitle">WebSocket Client Example</h2>

    <div class="message is-info">
      <p>Connect to the WebSocket server and send a message.</p>
    </div>

    <div id="status" class="message is-primary">
      <p>Status: Disconnected</p>
    </div>

    <button id="connectButton" class="button is-link">Connect to WebSocket</button>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/js/bulma.min.js"></script>
  
<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/11.8.1/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/11.8.1/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyAdLy8Bgw3xzy_2ny9fJCg--GLZhBfd-H4",
    authDomain: "sample-firebase-ai-app-c6c59.firebaseapp.com",
    projectId: "sample-firebase-ai-app-c6c59",
    storageBucket: "sample-firebase-ai-app-c6c59.firebasestorage.app",
    messagingSenderId: "325618577120",
    appId: "1:325618577120:web:31427ae194ee266ff76a85",
    measurementId: "G-Q16K11HS9N"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>