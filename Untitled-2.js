// backend-push-ia.js
const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = 4000;

app.use(express.json());

// Dossiers
const pushHub = path.join(__dirname, 'pushHub'); // dossier push "réseau" simulé localement
const validatedDir = path.join(__dirname, 'validated_pushes');
const quarantineDir = path.join(__dirname, 'quarantine');

// Création dossiers si absents
if (!fs.existsSync(validatedDir)) fs.mkdirSync(validatedDir);
if (!fs.existsSync(quarantineDir)) fs.mkdirSync(quarantineDir);

// Simulation IA simple
function evaluatePush(content) {
  // ici 98% OK, 4% erreur, 2% fallback (non réponse)
  const rand = Math.random() * 100;
  if (rand <= 98) return 'ok';
  if (rand <= 102) return 'error';
  return 'fallback';
}

// Endpoint pour récupérer tous les pushs non traités
app.get('/pushes', (req, res) => {
  fs.readdir(pushHub, (err, files) => {
    if (err) return res.status(500).json({ error: 'Erreur lecture dossier pushHub' });
    res.json({ pushes: files.filter(f => f.endsWith('.html')) });
  });
});

// Endpoint pour traiter un push
app.post('/process-push', (req, res) => {
  const { filename } = req.body;
  if (!filename) return res.status(400).json({ error: 'Nom de fichier requis' });

  const filePath = path.join(pushHub, filename);
  if (!fs.existsSync(filePath)) return res.status(404).json({ error: 'Fichier non trouvé' });

  const content = fs.readFileSync(filePath, 'utf8');
  const result = evaluatePush(content);

  if (result === 'ok') {
    fs.copyFileSync(filePath, path.join(validatedDir, filename));
    fs.unlinkSync(filePath);
    return res.json({ status: 'validé', filename });
  } else if (result === 'error') {
    fs.renameSync(filePath, path.join(quarantineDir, filename));
    return res.json({ status: 'erreur détectée', filename });
  } else {
    // fallback : ne supprime pas le fichier
    return res.json({ status: 'en attente ou non réponse IA', filename });
  }
});

app.listen(PORT, () => {
  console.log(`Serveur IA Push démarré sur http://localhost:${PORT}`);
});
const express = require('express');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = 4000;

app.use(express.json());

// Dossiers
const baseDir = __dirname; // dossier courant où est lancé le script
const pushHub = path.join(baseDir, 'pushHub');
const validatedDir = path.join(baseDir, 'validated_pushes');
const quarantineDir = path.join(baseDir, 'quarantine');

// Création dossiers si absents (automatique)
[pushHub, validatedDir, quarantineDir].forEach(dir => {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
    console.log(`Création du dossier : ${dir}`);
  }
});

// Simulation IA simple
function evaluatePush(content) {
  const rand = Math.random() * 100;
  if (rand <= 98) return 'ok';
  if (rand <= 102) return 'error';
  return 'fallback';
}

// Liste des pushs non traités
app.get('/pushes', (req, res) => {
  fs.readdir(pushHub, (err, files) => {
    if (err) return res.status(500).json({ error: 'Erreur lecture dossier pushHub' });
    res.json({ pushes: files.filter(f => f.endsWith('.html')) });
  });
});

// Traitement d’un push
app.post('/process-push', (req, res) => {
  const { filename } = req.body;
  if (!filename) return res.status(400).json({ error: 'Nom de fichier requis' });

  const filePath = path.join(pushHub, filename);
  if (!fs.existsSync(filePath)) return res.status(404).json({ error: `Fichier "${filename}" non trouvé dans pushHub` });

  const content = fs.readFileSync(filePath, 'utf8');
  const result = evaluatePush(content);

  if (result === 'ok') {
    fs.copyFileSync(filePath, path.join(validatedDir, filename));
    fs.unlinkSync(filePath);
    return res.json({ status: 'validé', filename });
  } else if (result === 'error') {
    fs.renameSync(filePath, path.join(quarantineDir, filename));
    return res.json({ status: 'erreur détectée', filename });
  } else {
    return res.json({ status: 'en attente ou non réponse IA', filename });
  }
});

app.listen(PORT, () => {
  console.log(`Serveur IA Push démarré sur http://localhost:${PORT}`);
});
node ton_fichier.js
