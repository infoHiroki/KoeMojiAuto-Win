@echo off
echo Dependency check for KoemojiAuto WebUI...
echo ======================================

echo Checking Python...
python --version
if errorlevel 1 (
    echo [ERROR] Python not found or not in PATH. Please install Python and try again.
    goto :error
)

echo.
echo Checking Flask...
python -c "import flask; print('Flask version:', flask.__version__)"
if errorlevel 1 (
    echo [ERROR] Flask not installed. Please run 'pip install flask'.
    goto :error
)

echo.
echo Checking psutil...
python -c "import psutil; print('psutil version:', psutil.__version__)"
if errorlevel 1 (
    echo [ERROR] psutil not installed. Please run 'pip install psutil'.
    goto :error
)

echo.
echo All dependencies are installed correctly!
echo You can now run start_webui.bat
goto :end

:error
echo.
echo Error: Some dependencies are missing. Please install them and try again.

:end
pause
