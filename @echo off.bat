@echo off
set "URL=https://exemple.com"
set "PY_SCRIPT=detect_web.py"

:: Lancer un script Python pour scraper et push
powershell -Command "Start-Process python '%PY_SCRIPT%' -Verb RunAs"
