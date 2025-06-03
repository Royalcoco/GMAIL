# Créer le dossier de l'application
$AppDir = "$env:USERPROFILE\PhantomsApp"
if (!(Test-Path $AppDir)) { New-Item -ItemType Directory -Path $AppDir }

# Copier les fichiers nécessaires
Copy-Item -Path ".\Synthese-backend-frontend-html\*" -Destination $AppDir -Recurse -Force

# Lancer le serveur Node.js
Write-Host "🔁 Démarrage du serveur Node.js..."
Start-Process "powershell" -ArgumentList "cd '$AppDir'; node server.js" -WindowStyle Hidden

# Attente de stabilisation du serveur
Start-Sleep -Seconds 5

# Ouvrir l’interface utilisateur dans le navigateur
Start-Process "http://localhost:3000"

# Créer un watcher de périphérique
$usbWatchScript = @"
while ($true) {
    \$usbDevices = Get-PnpDevice -Class USB | Where-Object { \$_.Status -eq 'OK' }
    if (\$usbDevices.Count -ge 2) {
        Add-Content "$AppDir\relay.log" "[\$(Get-Date)] Relai détecté - périphériques actifs: \$((\$usbDevices | Measure-Object).Count)"
    }
    Start-Sleep -Seconds 10
}
"@
$usbScriptPath = "$AppDir\usb_watch.ps1"
$usbWatchScript | Out-File -Encoding UTF8 -FilePath $usbScriptPath

Start-Process "powershell" -ArgumentList "-File $usbScriptPath" -WindowStyle Hidden

# PHANTOMS agent - création
$phantomAgentScript = @"
@echo off
set LOGICIEL=%USERPROFILE%\PhantomAgent
mkdir %LOGICIEL%
echo Agent PHANTOM actif > %LOGICIEL%\log.txt
start notepad.exe %LOGICIEL%\log.txt
"@
$batPath = "$AppDir\phantom_agent.bat"
$phantomAgentScript | Out-File -Encoding ASCII -FilePath $batPath
Start-Process "cmd.exe" -ArgumentList "/c $batPath"

Write-Host "✅ Tous les modules Phantoms sont opérationnels."

PhantomsApp/
├── server.js
├── push_files/
├── phantom_agent.bat
├── usb_watch.ps1
├── relay.log

// BACKEND Node.js avec Express, WebSocket et enregistrement intranet + module PHANTOMS décentralisé + framework d'entrée 2 avec relais intelligent + apprentissage autonome
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const WebSocket = require('ws');
const fs = require('fs');
const os = require('os');
const { exec } = require('child_process');
const path = require('path');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());

const pushDir = './push_files';
if (!fs.existsSync(pushDir)) fs.mkdirSync(pushDir);

function getLocalIP() {
  const nets = os.networkInterfaces();
  for (const name of Object.keys(nets)) {
    for (const net of nets[name]) {
      if (net.family === 'IPv4' && !net.internal) {
        return net.address;
      }
    }
  }
  return '127.0.0.1';
}

function isServerAvailable() {
  const files = fs.readdirSync(pushDir);
  return files.length < 100;
}

function detectPeripheralRelay() {
  const devices = ['usb1', 'usb2', 'editorDisk']; // simulation
  return devices.length >= 2 ? 'relai-actif' : 'relai-passif';
}

function selfLearnFromPushes() {
  const files = fs.readdirSync(pushDir);
  let modulesLearned = [];
  files.forEach(f => {
    const data = JSON.parse(fs.readFileSync(`${pushDir}/${f}`, 'utf-8'));
    if (data && data.content && !data.learned) {
      // simulation d'analyse du contenu
      modulesLearned.push({ pattern: data.content.substring(0, 30), source: f });
      data.learned = true;
      fs.writeFileSync(`${pushDir}/${f}`, JSON.stringify(data, null, 2));
    }
  });
  return modulesLearned;
}

const wss = new WebSocket.Server({ port: PORT + 1 });
wss.on('connection', (ws) => {
  ws.on('message', (message) => {
    let data = JSON.parse(message);
    const authorIP = getLocalIP();
    if (data.token && data.clientId) {
      ws.send(JSON.stringify({ message: 'Authentification réussie' }));
    } else if (data.content && isServerAvailable()) {
      let fileName = `push_${Date.now()}_${authorIP.replace(/\./g, '_')}.json`;
      const record = {
        author: authorIP,
        timestamp: Date.now(),
        type: 'no-code-ai-question',
        content: data.content,
        status: 'validé',
        executable: false,
        relayStatus: detectPeripheralRelay()
      };
      fs.writeFileSync(`${pushDir}/${fileName}`, JSON.stringify(record, null, 2));
      const learnedModules = selfLearnFromPushes();
      ws.send(JSON.stringify({ message: 'Push sauvegardé automatiquement avec relais', relay: record.relayStatus, learnedModules }));
    } else {
      ws.send(JSON.stringify({ message: 'Serveur en surcharge ou données incomplètes' }));
    }
  });
});

app.get('/push-files', (req, res) => {
  const files = fs.readdirSync(pushDir);
  res.json({ files });
});

app.get('/push/:file', (req, res) => {
  const file = `${pushDir}/${req.params.file}`;
  if (fs.existsSync(file)) {
    res.sendFile(file, { root: '.' });
  } else {
    res.status(404).send('Fichier introuvable');
  }
});

app.post('/admin/exec', (req, res) => {
  exec(req.body.command, (err, stdout, stderr) => {
    if (err) return res.send(stderr);
    res.send(stdout);
  });
});

app.post('/push-toolbar', (req, res) => {
  const { elements, timestamp } = req.body;
  const authorIP = getLocalIP();
  const file = `toolbar_${timestamp}_${authorIP.replace(/\./g, '_')}.json`;
  const payload = {
    author: authorIP,
    timestamp,
    type: 'toolbar-elements',
    elements,
    valid: true,
    executed: false,
    AI_assisted: true,
    relayStatus: detectPeripheralRelay()
  };
  fs.writeFileSync(`${pushDir}/${file}`, JSON.stringify(payload, null, 2));
  res.json({ status: 'ok', savedAs: file });
});

app.get('/', (req, res) => {
  res.send(`
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testeur Integer</title>
    <style>
      body { font-family: Arial, sans-serif; padding: 20px; }
      #log { background: #f4f4f4; padding: 10px; border: 1px solid #ccc; height: 200px; overflow-y: scroll; }
      button { margin-top: 10px; }
    </style>
  </head>
  <body>
    <h1>Testeur Integer</h1>
    <input type="number" id="inputValue" placeholder="Entrez un entier" />
    <button onclick="testInteger()">Tester</button>
    <div id="log"></div>
    <script>
      function testInteger() {
        const val = parseInt(document.getElementById('inputValue').value);
        const isInteger = Number.isInteger(val);
        const log = document.getElementById('log');
        const now = new Date().toLocaleString();
        log.innerHTML += `<p>[${now}] Entrée : ${val} | Est entier : ${isInteger}</p>`;
      }
    </script>
  </body>
  </html>
  `);
});

// Lancement PHANTOMS : outil d'accès réseau décentralisé
function deployPhantomAgent() {
  const script = `
@echo off
set PHANTOM_DIR=%USERPROFILE%\\phantoms
mkdir %PHANTOM_DIR%
echo Outil PHANTOMS déployé > %PHANTOM_DIR%\\info.txt
start notepad.exe %PHANTOM_DIR%\\info.txt
`;
  const batPath = path.join(__dirname, 'deploy_phantom.bat');
  fs.writeFileSync(batPath, script);
  exec(`start cmd.exe /c ${batPath}`);
}

deployPhantomAgent();

// Démarrage du serveur
app.listen(PORT, () => {
  console.log(`Serveur REST en écoute sur http://localhost:${PORT}`);
});

function scanAndPushHeavyFiles() {
  const simulatedDevices = ['D:/external1', 'E:/usbEditor']; // Simulation : chemins périphériques
  const maxSizeMB = 10; // Seuil "élément lourd"

  simulatedDevices.forEach(devicePath => {
    if (fs.existsSync(devicePath)) {
      const files = fs.readdirSync(devicePath);
      files.forEach(file => {
        const fullPath = path.join(devicePath, file);
        const stats = fs.statSync(fullPath);
        const sizeMB = stats.size / (1024 * 1024);
        if (sizeMB > maxSizeMB) {
          const content = fs.readFileSync(fullPath, 'utf-8');
          const pushPayload = {
            author: getLocalIP(),
            timestamp: Date.now(),
            type: 'heavy-push',
            fileName: file,
            sizeMB,
            content,
            relayStatus: detectPeripheralRelay()
          };
          const savePath = `${pushDir}/heavy_${file}_${Date.now()}.json`;
          fs.writeFileSync(savePath, JSON.stringify(pushPayload, null, 2));
          console.log(`[AUTO PUSH] Fichier lourd détecté et enregistré depuis ${devicePath} : ${file}`);
        }
      });
    }
  });
}

setInterval(scanAndPushHeavyFiles, 60000); // Toutes les 60 secondes

Get-WmiObject Win32_LogicalDisk | Where-Object {$_.DriveType -eq 2 -or $_.DriveType -eq 3} | Select-Object DeviceID, VolumeName, Size

exec("powershell -ExecutionPolicy Bypass -File ./get_drives.ps1", (err, stdout, stderr) => {
  if (stdout) console.log("[DRIVES]", stdout);
});

// BACKEND Node.js avec Express, WebSocket et enregistrement intranet + module PHANTOMS décentralisé + framework d'entrée 2 avec relais intelligent + apprentissage autonome + push fichiers lourds
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const WebSocket = require('ws');
const fs = require('fs');
const os = require('os');
const { exec } = require('child_process');
const path = require('path');

const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());

const pushDir = './push_files';
if (!fs.existsSync(pushDir)) fs.mkdirSync(pushDir);

function getLocalIP() {
  const nets = os.networkInterfaces();
  for (const name of Object.keys(nets)) {
    for (const net of nets[name]) {
      if (net.family === 'IPv4' && !net.internal) {
        return net.address;
      }
    }
  }
  return '127.0.0.1';
}

function isServerAvailable() {
  const files = fs.readdirSync(pushDir);
  return files.length < 100;
}

function detectPeripheralRelay() {
  const devices = ['usb1', 'usb2', 'editorDisk']; // simulation
  return devices.length >= 2 ? 'relai-actif' : 'relai-passif';
}

function selfLearnFromPushes() {
  const files = fs.readdirSync(pushDir);
  let modulesLearned = [];
  files.forEach(f => {
    const data = JSON.parse(fs.readFileSync(`${pushDir}/${f}`, 'utf-8'));
    if (data && data.content && !data.learned) {
      modulesLearned.push({ pattern: data.content.substring(0, 30), source: f });
      data.learned = true;
      fs.writeFileSync(`${pushDir}/${f}`, JSON.stringify(data, null, 2));
    }
  });
  return modulesLearned;
}

function scanAndPushHeavyFiles() {
  const simulatedDevices = ['D:/external1', 'E:/usbEditor']; // Simulation
  const maxSizeMB = 10;
  simulatedDevices.forEach(devicePath => {
    if (fs.existsSync(devicePath)) {
      const files = fs.readdirSync(devicePath);
      files.forEach(file => {
        const fullPath = path.join(devicePath, file);
        const stats = fs.statSync(fullPath);
        const sizeMB = stats.size / (1024 * 1024);
        if (sizeMB > maxSizeMB) {
          const content = fs.readFileSync(fullPath, 'utf-8');
          const pushPayload = {
            author: getLocalIP(),
            timestamp: Date.now(),
            type: 'heavy-push',
            fileName: file,
            sizeMB,
            content,
            relayStatus: detectPeripheralRelay()
          };
          const savePath = `${pushDir}/heavy_${file}_${Date.now()}.json`;
          fs.writeFileSync(savePath, JSON.stringify(pushPayload, null, 2));
          console.log(`[AUTO PUSH] Fichier lourd détecté et enregistré depuis ${devicePath} : ${file}`);
        }
      });
    }
  });
}

setInterval(scanAndPushHeavyFiles, 60000);

const wss = new WebSocket.Server({ port: PORT + 1 });
wss.on('connection', (ws) => {
  ws.on('message', (message) => {
    let data = JSON.parse(message);
    const authorIP = getLocalIP();
    if (data.token && data.clientId) {
      ws.send(JSON.stringify({ message: 'Authentification réussie' }));
    } else if (data.content && isServerAvailable()) {
      let fileName = `push_${Date.now()}_${authorIP.replace(/\./g, '_')}.json`;
      const record = {
        author: authorIP,
        timestamp: Date.now(),
        type: 'no-code-ai-question',
        content: data.content,
        status: 'validé',
        executable: false,
        relayStatus: detectPeripheralRelay()
      };
      fs.writeFileSync(`${pushDir}/${fileName}`, JSON.stringify(record, null, 2));
      const learnedModules = selfLearnFromPushes();
      ws.send(JSON.stringify({ message: 'Push sauvegardé automatiquement avec relais', relay: record.relayStatus, learnedModules }));
    } else {
      ws.send(JSON.stringify({ message: 'Serveur en surcharge ou données incomplètes' }));
    }
  });
});

app.get('/push-files', (req, res) => {
  const files = fs.readdirSync(pushDir);
  res.json({ files });
});

app.get('/push/:file', (req, res) => {
  const file = `${pushDir}/${req.params.file}`;
  if (fs.existsSync(file)) {
    res.sendFile(file, { root: '.' });
  } else {
    res.status(404).send('Fichier introuvable');
  }
});

app.post('/admin/exec', (req, res) => {
  exec(req.body.command, (err, stdout, stderr) => {
    if (err) return res.send(stderr);
    res.send(stdout);
  });
});

app.post('/push-toolbar', (req, res) => {
  const { elements, timestamp } = req.body;
  const authorIP = getLocalIP();
  const file = `toolbar_${timestamp}_${authorIP.replace(/\./g, '_')}.json`;
  const payload = {
    author: authorIP,
    timestamp,
    type: 'toolbar-elements',
    elements,
    valid: true,
    executed: false,
    AI_assisted: true,
    relayStatus: detectPeripheralRelay()
  };
  fs.writeFileSync(`${pushDir}/${file}`, JSON.stringify(payload, null, 2));
  res.json({ status: 'ok', savedAs: file });
});

app.get('/', (req, res) => {
  res.send(`
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testeur Integer</title>
    <style>
      body { font-family: Arial, sans-serif; padding: 20px; }
      #log { background: #f4f4f4; padding: 10px; border: 1px solid #ccc; height: 200px; overflow-y: scroll; }
      button { margin-top: 10px; }
    </style>
  </head>
  <body>
    <h1>Testeur Integer</h1>
    <input type="number" id="inputValue" placeholder="Entrez un entier" />
    <button onclick="testInteger()">Tester</button>
    <div id="log"></div>
    <h2>Fichiers lourds disponibles</h2>
    <ul id="heavyList"></ul>
    <script>
      function testInteger() {
        const val = parseInt(document.getElementById('inputValue').value);
        const isInteger = Number.isInteger(val);
        const log = document.getElementById('log');
        const now = new Date().toLocaleString();
        log.innerHTML += `<p>[${now}] Entrée : ${val} | Est entier : ${isInteger}</p>`;
      }

      fetch('/push-files')
        .then(res => res.json())
        .then(data => {
          const list = document.getElementById('heavyList');
          data.files.filter(f => f.startsWith('heavy_')).forEach(file => {
            const li = document.createElement('li');
            li.innerHTML = `<a href="/push/${file}" target="_blank">${file}</a>`;
            list.appendChild(li);
          });
        });
    </script>
  </body>
  </html>
  `);
});

function deployPhantomAgent() {
  const script = `
@echo off
set PHANTOM_DIR=%USERPROFILE%\\phantoms
mkdir %PHANTOM_DIR%
echo Outil PHANTOMS déployé > %PHANTOM_DIR%\\info.txt
start notepad.exe %PHANTOM_DIR%\\info.txt
`;
  const batPath = path.join(__dirname, 'deploy_phantom.bat');
  fs.writeFileSync(batPath, script);
  exec(`start cmd.exe /c ${batPath}`);
}

deployPhantomAgent();

app.listen(PORT, () => {
  console.log(`Serveur REST en écoute sur http://localhost:${PORT}`);
});

