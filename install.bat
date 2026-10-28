@echo off
setlocal

set "PROJECT_DIR=%~dp0tools\FZEasyMarauderFlash"
set "VENV_DIR=%PROJECT_DIR%\.venv"
set "PYTHON="

where git >nul 2>nul
if errorlevel 1 (
    echo ERROR: Git for Windows was not found. Install Git and run this script again.
    exit /b 1
)

where py >nul 2>nul
if not errorlevel 1 set "PYTHON=py -3"
if not defined PYTHON (
    where python >nul 2>nul
    if not errorlevel 1 set "PYTHON=python"
)
if not defined PYTHON (
    echo ERROR: Python 3 was not found. Install Python 3 and run this script again.
    exit /b 1
)

if not exist "%PROJECT_DIR%\EasyInstall.py" (
    if exist "%PROJECT_DIR%" (
        echo ERROR: "%PROJECT_DIR%" exists but does not contain EasyInstall.py.
        echo Remove or rename that incomplete folder, then run this script again.
        exit /b 1
    )
    if not exist "%~dp0tools" mkdir "%~dp0tools"
    git clone https://github.com/SkeletonMan03/FZEasyMarauderFlash.git "%PROJECT_DIR%"
    if errorlevel 1 exit /b 1
)

if not exist "%PROJECT_DIR%\requirements.txt" (
    echo ERROR: requirements.txt was not found in "%PROJECT_DIR%".
    exit /b 1
)

if not exist "%VENV_DIR%\Scripts\python.exe" (
    %PYTHON% -m venv "%VENV_DIR%"
    if errorlevel 1 (
        echo ERROR: Could not create the Python virtual environment.
        exit /b 1
    )
)

"%VENV_DIR%\Scripts\python.exe" -m pip install -r "%PROJECT_DIR%\requirements.txt"
if errorlevel 1 (
    echo ERROR: Python package installation failed.
    exit /b 1
)

echo.
echo Installation complete. Run flash.bat from this folder to start the upstream flasher.
exit /b 0
