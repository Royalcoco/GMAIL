@echo off
REM Crée les dossiers nécessaires
if not exist pushHub mkdir pushHub
if not exist validated_pushes mkdir validated_pushes
if not exist quarantine mkdir quarantine

REM Affiche confirmation
echo Dossiers pushHub, validated_pushes et quarantine crees (ou deja existants).

REM Lance le serveur Node.js
echo Demarrage du serveur Node.js...
node server.js

pause
npm install axios
node test-push.js
const fs = require('fs');
const path = require('path');
const axios = require('axios');

const pushHub = path.join(__dirname, 'pushHub');
const filename = 'exemple.html';  // Assure-toi que ce fichier existe dans pushHub
const filePath = path.join(pushHub, filename);

if (!fs.existsSync(filePath)) {
  console.error(`Fichier ${filename} non trouvé dans pushHub`);
  process.exit(1);
}

axios.post('http://localhost:4000/process-push', { filename })
  .then(res => {
    console.log('Réponse serveur:', res.data);
  })
  .catch(err => {
    console.error('Erreur requête:', err.message);
  });
