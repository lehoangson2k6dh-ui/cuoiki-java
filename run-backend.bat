@echo off
REM Script to run Backend Spring Boot Application

cd /d "%~dp0backend"

echo ====================================
echo  Banking App - Starting Backend
echo ====================================
echo.

REM Check if Maven is installed
where mvn >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Maven is not installed or not in PATH!
    echo.
    echo Please install Maven from: https://maven.apache.org/download.cgi
    echo Or use IntelliJ IDEA to run the backend.
    echo.
    pause
    exit /b 1
)

echo [OK] Maven found
echo.

REM Check if MySQL is running
sc query MySQL80 | find "RUNNING" >nul
if %errorlevel% neq 0 (
    echo [WARNING] MySQL service is not running!
    echo Please start MySQL service first.
    echo.
    pause
)

echo [INFO] Building and starting backend...
echo.
echo This may take a few minutes on first run...
echo.

REM Run Spring Boot application
mvn spring-boot:run

pause
