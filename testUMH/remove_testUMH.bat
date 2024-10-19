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

echo testUmhLoader.exe /stopdriver /uninstall
testUmhLoader.exe /stopdriver /uninstall
if %errorLevel% NEQ 0 (
    echo Failed to run testUmhLoader.exe
    pause
    exit /b 1
)

echo Deleting all files in %TESTUMH_DIR%
del /q /s /f "%TESTUMH_DIR%\*"
if %errorLevel% NEQ 0 (
    echo Failed to delete files in %TESTUMH_DIR%
    pause
    exit /b 1
)

echo Done

endlocal
pause