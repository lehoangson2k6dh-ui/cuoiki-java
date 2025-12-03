@echo off
REM Script to run Frontend React Application

cd /d "%~dp0frontend"

echo ====================================
echo  Banking App - Starting Frontend
echo ====================================
echo.

REM Check if Node.js is installed
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed or not in PATH!
    echo.
    echo Please install Node.js from: https://nodejs.org/
    echo.
    pause
    exit /b 1
)

echo [OK] Node.js found
node --version
npm --version
echo.

REM Check if node_modules exists
if not exist "node_modules\" (
    echo [INFO] Installing dependencies...
    echo This may take a few minutes...
    echo.
    call npm install
    if %errorlevel% neq 0 (
        echo.
        echo [ERROR] Failed to install dependencies!
        pause
        exit /b 1
    )
)

echo [INFO] Starting development server...
echo.
echo Frontend will open at: http://localhost:5173
echo Backend should be running at: http://localhost:8080
echo.

REM Run development server
npm run dev

pause
