@echo off
echo Starting KoeMojiAuto WebUI...

:: Open browser in background after a delay
start /b cmd /c "timeout /t 5 /nobreak > nul && start http://localhost:8080"

:: Minimize this window
powershell -window minimized -command ""

:: Start Python in the current window
echo Starting server...
echo To stop the server, press Ctrl+C
python webui.py