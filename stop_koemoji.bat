@echo off
echo Stopping KoemojiAuto...

:: PythonでKoemojiAutoプロセスを終了
for /f "tokens=2" %%p in ('tasklist /fi "imagename eq python.exe" /fo list ^| findstr "PID:"') do (
    wmic process %%p get commandline | findstr "main.py" > nul
    if not errorlevel 1 (
        taskkill /F /PID %%p
        echo Terminated PID: %%p
    )
)

echo Done