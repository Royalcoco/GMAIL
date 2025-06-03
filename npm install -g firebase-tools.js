npm install -g firebase-tools
firebase login
firebase init
// Structure du projet: React (frontend) + Node.js (backend) + WebSocket temps réel + push collaboratif + stockage cloud + éditeur no-code visuel + commande admin

// --- FRONTEND: App.jsx ---
import { useEffect, useRef, useState } from 'react';

export default function App() {
  const [input, setInput] = useState('');
  const [result, setResult] = useState(null);
  const [pushFiles, setPushFiles] = useState([]);
  const [authStatus, setAuthStatus] = useState('');
  const ws = useRef(null);

  useEffect(() => {
    ws.current = new WebSocket('ws://localhost:3000');
    ws.current.onopen = () => {
      ws.current.send(JSON.stringify({ token: 'token-client-123', clientId: 'client123' }));
    };
    ws.current.onmessage = (event) => {
      const data = JSON.parse(event.data);
      if (data.message === 'Authentification réussie') {
        setAuthStatus('Connecté');
      } else if (data.message === 'Push sauvegardé') {
        fetchPushFiles();
      } else {
        console.log('WS Message:', data);
      }
    };
    ws.current.onerror = (err) => console.error('WS Error:', err);
    ws.current.onclose = () => setAuthStatus('Déconnecté');
  }, []);

  const handlePush = () => {
    const payload = { content: input, timestamp: Date.now() };
    ws.current.send(JSON.stringify(payload));
    setInput('');
  };

  const fetchPushFiles = async () => {
    const res = await fetch('http://localhost:3000/push-files');
    const data = await res.json();
    setPushFiles(data.files);
  };

  useEffect(() => {
    fetchPushFiles();
  }, []);

  return (
    <div className="p-4">
      <h1 className="text-xl font-bold">Push Collaboratif Temps Réel</h1>
      <div>Status WebSocket: {authStatus}</div>
      <div className="my-4">
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          className="border p-2 mr-2"
          placeholder="Message à envoyer"
        />
        <button onClick={handlePush} className="bg-blue-500 text-white p-2 rounded">
          Envoyer Push
        </button>
      </div>

      <div className="mt-8">
        <h2 className="font-semibold">Pages générées collaborativement</h2>
        <ul className="list-disc ml-5">
          {pushFiles.map((file) => (
            <li key={file}>
              <a href={`http://localhost:3000/push/${file}`} className="text-blue-600 underline" target="_blank">
                {file}
              </a>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}

// --- BACKEND: server.js ---
const express = require('express');
const http = require('http');
const WebSocket = require('ws');
const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');

const app = express();
const server = http.createServer(app);
const wss = new WebSocket.Server({ server });

app.use(express.json());

const pushDir = path.join(__dirname, 'cloud');
if (!fs.existsSync(pushDir)) fs.mkdirSync(pushDir);

const validTokens = new Set(['token-client-123', 'token-client-456']);
const clients = new Map();

function savePush(clientId, data) {
  const filename = `push-from-${clientId}-${Date.now()}.json`;
  const filepath = path.join(pushDir, filename);
  fs.writeFileSync(filepath, JSON.stringify(data, null, 2));
  return filename;
}

wss.on('connection', (ws) => {
  ws.once('message', (msg) => {
    let parsed;
    try {
      parsed = JSON.parse(msg);
    } catch {
      ws.send(JSON.stringify({ error: 'JSON invalide' }));
      ws.close();
      return;
    }
    const { token, clientId } = parsed;
    if (!token || !clientId || !validTokens.has(token)) {
      ws.send(JSON.stringify({ error: 'Authentification échouée' }));
      ws.close();
      return;
    }
    clients.set(ws, { clientId, token });
    ws.send(JSON.stringify({ message: 'Authentification réussie' }));

    ws.on('message', (message) => {
      let pushData;
      try {
        pushData = JSON.parse(message);
      } catch {
        ws.send(JSON.stringify({ error: 'JSON invalide dans push' }));
        return;
      }
      const { clientId } = clients.get(ws);
      const filename = savePush(clientId, pushData);
      ws.send(JSON.stringify({ message: 'Push sauvegardé', file: filename }));
    });

    ws.on('close', () => {
      clients.delete(ws);
    });
  });
});

app.get('/push-files', (req, res) => {
  const files = fs.readdirSync(pushDir).filter(f => f.startsWith('push-') && f.endsWith('.json'));
  res.json({ files });
});

app.get('/push/:filename', (req, res) => {
  const filePath = path.join(pushDir, req.params.filename);
  if (fs.existsSync(filePath)) {
    res.sendFile(filePath);
  } else {
    res.status(404).send('Fichier non trouvé');
  }
});

// Commande admin Windows (exécutable depuis .bat ou powershell)
app.post('/admin/exec', (req, res) => {
  const { command } = req.body;
  if (!command) return res.status(400).send('Commande manquante');
  exec(command, (error, stdout, stderr) => {
    if (error) return res.status(500).send(`Erreur: ${stderr}`);
    res.send(`Résultat: ${stdout}`);
  });
});

const PORT = 3000;
server.listen(PORT, () => {
  console.log(`Serveur lancé sur port ${PORT}`);
});
firebase deploy