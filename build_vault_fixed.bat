@echo off
setlocal EnableExtensions

echo ========================================
echo        VAULT - WINDOWS BUILD SCRIPT
echo ========================================
echo.

REM Find the folder containing main.py.
set "SCRIPT_DIR=%~dp0"
set "PROJECT_DIR="

if exist "%SCRIPT_DIR%main.py" set "PROJECT_DIR=%SCRIPT_DIR%"

if not defined PROJECT_DIR if exist "%USERPROFILE%\Documents\Vault\main.py" set "PROJECT_DIR=%USERPROFILE%\Documents\Vault\"

if not defined PROJECT_DIR if exist "%USERPROFILE%\Desktop\Vault\main.py" set "PROJECT_DIR=%USERPROFILE%\Desktop\Vault\"

if not defined PROJECT_DIR if exist "%USERPROFILE%\Downloads\Vault\main.py" set "PROJECT_DIR=%USERPROFILE%\Downloads\Vault\"

if not defined PROJECT_DIR (
    echo ERROR: I could not find main.py.
    echo.
    echo Put this build_vault.bat in the same folder as main.py,
    echo or make sure your project is at:
    echo %USERPROFILE%\Documents\Vault
    echo.
    pause
    exit /b 1
)

cd /d "%PROJECT_DIR%"

echo Project folder:
echo %CD%
echo.

echo [1/4] Checking Python...
where py >nul 2>&1
if %errorlevel%==0 (
    set "PY=py"
) else (
    where python >nul 2>&1
    if %errorlevel%==0 (
        set "PY=python"
    ) else (
        echo Python was not found on this PC.
        echo Install Python, then run this again.
        pause
        exit /b 1
    )
)

%PY% --version
if errorlevel 1 (
    echo Python could not be started.
    pause
    exit /b 1
)

echo.
echo [2/4] Installing build dependencies...
%PY% -m pip install --upgrade pyinstaller openpyxl
if errorlevel 1 (
    echo.
    echo Dependency installation failed.
    pause
    exit /b 1
)

echo.
echo [3/4] Building Vault.exe...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist
if exist Vault.spec del /q Vault.spec

%PY% -m PyInstaller --onefile --windowed --name Vault main.py
if errorlevel 1 (
    echo.
    echo Build failed.
    pause
    exit /b 1
)

if not exist "dist\Vault.exe" (
    echo.
    echo PyInstaller finished, but Vault.exe was not found.
    pause
    exit /b 1
)

echo.
echo [4/4] Build complete.
echo.
echo Your application is here:
echo %CD%\dist\Vault.exe

echo.
echo IMPORTANT:
echo Keep vault.db in the same folder as Vault.exe while using the packaged app.
echo.
pause
