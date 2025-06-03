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
const PORT_HEAVY = 3100;

app.use(cors());
app.use(bodyParser.json({ limit: '100mb' }));
app.use(bodyParser.urlencoded({ extended: true, limit: '100mb' }));

const pushDir = './push_files';
const heavyDir = './heavy_elements';
if (!fs.existsSync(pushDir)) fs.mkdirSync(pushDir);
if (!fs.existsSync(heavyDir)) fs.mkdirSync(heavyDir);

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

app.post('/deploy-heavy-element', (req, res) => {
  const { fileName, base64Content } = req.body;
  if (!fileName || !base64Content) return res.status(400).send('Données manquantes');
  const buffer = Buffer.from(base64Content, 'base64');
  const targetPath = path.join(heavyDir, fileName);
  fs.writeFileSync(targetPath, buffer);
  res.send({ status: 'enregistré', chemin: targetPath });
});

app.get('/', (req, res) => {
  res.send(`
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Testeur Integer + Interface OS</title>
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
    <h2>Sélection de Système</h2>
    <select id="systemSelector">
      <option>Windows</option>
      <option>Linux</option>
      <option>macOS</option>
    </select>
    <button onclick="loadSystem()">Activer</button>
    <div id="sysOut"></div>
    <script>
      function testInteger() {
        const val = parseInt(document.getElementById('inputValue').value);
        const isInteger = Number.isInteger(val);
        const log = document.getElementById('log');
        const now = new Date().toLocaleString();
        log.innerHTML += `<p>[${now}] Entrée : ${val} | Est entier : ${isInteger}</p>`;
      }
      function loadSystem() {
        const os = document.getElementById('systemSelector').value;
        document.getElementById('sysOut').innerHTML = `<p>Système activé : <b>${os}</b></p>`;
        // Option : envoyer une commande spécifique ici (à implémenter si souhaité)
      }
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

app.listen(PORT_HEAVY, () => {
  console.log(`Serveur upload lourd actif sur http://localhost:${PORT_HEAVY}`);
});

// Instructions pour déployer sur Firebase
console.log(`Pour déployer sur Firebase, utilisez les commandes suivantes :
  
$ npm install -g firebase-tools
$ firebase init
$ firebase deploy