<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8" />
<title>Push Client Manager</title>
<style>
  body { font-family: Arial, sans-serif; margin: 20px; }
  button { padding: 10px 20px; margin: 10px 0; }
  #log { background: #f0f0f0; height: 250px; overflow-y: scroll; padding: 10px; border: 1px solid #ccc; }
</style>
</head>
<body>
<h2>Gestionnaire Push Dynamique</h2>
<button id="startPush">Lancer Génération Push</button>
<div id="log"></div>

<script>
  const log = document.getElementById('log');
  const ws = new WebSocket('ws://' + window.location.hostname + ':3001');
  
  ws.onopen = () => logMessage('Connexion WebSocket établie');
  ws.onclose = () => logMessage('Connexion WebSocket fermée');
  ws.onerror = e => logMessage('Erreur WebSocket: ' + e.message);
  ws.onmessage = e => {
    const data = JSON.parse(e.data);
    logMessage('Réponse serveur: ' + JSON.stringify(data));
  };

  function logMessage(msg) {
    const p = document.createElement('p');
    p.textContent = `[${new Date().toLocaleTimeString()}] ${msg}`;
    log.appendChild(p);
    log.scrollTop = log.scrollHeight;
  }

  function simulateDeviceDetection() {
    // Simule détection appareils (ex: 3 appareils)
    return [
      { id: 'device1', ip: '192.168.1.10', signal: Math.floor(Math.random() * 1000) },
      { id: 'device2', ip: '192.168.1.11', signal: Math.floor(Math.random() * 1000) },
      { id: 'device3', ip: '192.168.1.12', signal: Math.floor(Math.random() * 1000) }
    ];
  }

  async function sendPush(data) {
    return new Promise((resolve) => {
      if (ws.readyState === WebSocket.OPEN) {
        ws.send(JSON.stringify(data));
        resolve(true);
      } else {
        resolve(false);
      }
    });
  }

  document.getElementById('startPush').onclick = async () => {
    const devices = simulateDeviceDetection();
    logMessage('Appareils détectés : ' + devices.map(d => d.id).join(', '));

    for (const device of devices) {
      logMessage(`Préparation push pour ${device.id} (${device.ip})`);
      // Simulation no code / délai chargement commande
      await new Promise(r => setTimeout(r, 1500));

      const pushData = {
        authorIP: device.ip,
        type: 'no-code-ai-question',
        content: `Push automatique pour ${device.id}`,
        signal: device.signal
      };

      const success = await sendPush(pushData);
      if (success) {
        logMessage(`Push envoyé pour ${device.id}`);
      } else {
        logMessage(`Erreur push pour ${device.id}`);
      }
    }
    logMessage('Génération push terminée');
  };
</script>
</body>
</html>
