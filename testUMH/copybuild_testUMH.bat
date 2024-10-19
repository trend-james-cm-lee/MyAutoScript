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
    mkdir "%TESTUMH_DIR%"
    if %errorLevel% NEQ 0 (
        echo Failed to create folder testUMH
        pause
        exit /b 1
    )
    echo Folder testUMH created at %TESTUMH_DIR%
) else (
    echo Folder testUMH already exists at %TESTUMH_DIR%
)

echo copy build files
copy /y "\\tsclient\D\project\TMUMH_P4\QA\testUMH\binx64\Release\*" "%TESTUMH_DIR%\*"
if %errorLevel% NEQ 0 (
    echo Failed to copy build files
    pause
    exit /b 1
)

echo Done

endlocal
pause