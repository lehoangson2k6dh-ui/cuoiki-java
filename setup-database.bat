@echo off
REM Script to create database and tables for Banking Application

echo ====================================
echo  Banking App - Database Setup
echo ====================================
echo.

REM Check if MySQL is running
sc query MySQL80 | find "RUNNING" >nul
if %errorlevel% neq 0 (
    echo [ERROR] MySQL service is not running!
    echo Please start MySQL service first.
    pause
    exit /b 1
)

echo [OK] MySQL service is running
echo.

REM Find MySQL installation path
set MYSQL_PATH=
for %%p in (
    "C:\Program Files\MySQL\MySQL Server 8.0\bin"
    "C:\Program Files\MySQL\MySQL Server 8.4\bin"
    "C:\Program Files (x86)\MySQL\MySQL Server 8.0\bin"
    "C:\xampp\mysql\bin"
) do (
    if exist %%p\mysql.exe (
        set MYSQL_PATH=%%~p
        goto :found
    )
)

:found
if "%MYSQL_PATH%"=="" (
    echo [ERROR] MySQL executable not found!
    echo Please install MySQL or add it to your PATH
    pause
    exit /b 1
)

echo [OK] Found MySQL at: %MYSQL_PATH%
echo.

REM Run schema.sql
echo Creating database and tables...
"%MYSQL_PATH%\mysql.exe" -u root -p123456 < "%~dp0backend\src\main\resources\schema.sql"

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Failed to create database!
    echo Please check:
    echo   1. MySQL username is 'root'
    echo   2. MySQL password is '123456'
    echo   3. You have permissions to create databases
    pause
    exit /b 1
)

echo.
echo [SUCCESS] Database 'banking_app' created successfully!
echo.
echo Tables created:
echo   - customers
echo   - accounts
echo   - savings_accounts
echo   - checking_accounts
echo   - transactions
echo.
pause
