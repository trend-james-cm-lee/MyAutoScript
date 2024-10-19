@echo off
setlocal

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script requires administrative privileges.
    pause
    exit /b 1
)

set TESTUMH_DIR=c:\users\%username%\testUMH
if not exist "%TESTUMH_DIR%" (
    echo %TESTUMH_DIR% not found
    pause
    exit /b 1
)

cd /d %TESTUMH_DIR%
echo Running the script from %cd%

echo testUmhLoader.exe /stopdriver
testUmhLoader.exe /stopdriver
if %errorLevel% NEQ 0 (
    echo Failed to run testUmhLoader.exe
    pause
    exit /b 1
)

echo Done

endlocal
pause