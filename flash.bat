@echo off
setlocal

set "PROJECT_DIR=%~dp0tools\FZEasyMarauderFlash"
set "PYTHON=%PROJECT_DIR%\.venv\Scripts\python.exe"

if not "%~2"=="" (
    echo Usage: flash.bat [COM-port]
    echo Example: flash.bat COM5
    exit /b 2
)

if not exist "%PROJECT_DIR%\EasyInstall.py" (
    echo ERROR: FZEasyMarauderFlash was not found. Run install.bat first.
    exit /b 1
)
if not exist "%PYTHON%" (
    echo ERROR: Python environment was not found. Run install.bat first.
    exit /b 1
)

pushd "%PROJECT_DIR%"
if errorlevel 1 exit /b 1
if "%~1"=="" (
    "%PYTHON%" EasyInstall.py
) else (
    "%PYTHON%" EasyInstall.py --serialport "%~1"
)
set "RESULT=%ERRORLEVEL%"
popd
exit /b %RESULT%
