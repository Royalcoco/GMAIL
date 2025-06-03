@echo off
title Lancement du Système Collaboratif - Admin Command

:: CONFIG - Point d’accès centralisé
set ROOT_DIR=%~dp0
set SHARED_PATH=%USERPROFILE%\PartageClient
set LOGS_PATH=%ROOT_DIR%logs
set BACKEND_PORT=3000

:: Étape 1 - Initialisation du serveur backend
echo [INFO] Lancement du serveur Node.js...
start cmd /k "cd /d %ROOT_DIR%backend && node server.js"

:: Étape 2 - Lancement de l'interface frontend (React)
echo [INFO] Lancement de l'interface React...
start cmd /k "cd /d %ROOT_DIR%frontend && npm start"

:: Étape 3 - Ouverture automatique de l'interface dans le navigateur
timeout /t 5 > nul
start http://localhost:%BACKEND_PORT%

:: Étape 4 - Création d’un dossier de réseau partagé simulé
echo [INFO] Simulation de réseau partagé...
mkdir "%SHARED_PATH%"
net share PartageClient="%SHARED_PATH%" /GRANT:everyone,READ

:: Étape 5 - Activation du journal des push
echo [INFO] Initialisation du log collaboratif...
if not exist "%LOGS_PATH%" mkdir "%LOGS_PATH%"
echo. > "%LOGS_PATH%\push-log.txt"

:: Étape 6 - Lancement de l'éditeur no-code
echo [INFO] Lancement du visual builder...
start cmd /k "cd /d %ROOT_DIR%editor && npm run start"

:: Étape 7 - Déploiement du PHANTOM agent
echo [INFO] Déploiement de l’agent PHANTOM...
call "%ROOT_DIR%backend\deploy_phantom.bat"

echo [SUCCESS] Système collaboratif lancé avec succès.
pause
