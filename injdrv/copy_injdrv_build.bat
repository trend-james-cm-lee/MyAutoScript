:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script requires administrative privileges.
    pause
    exit /b 1
)

cd /d %~dp0
copy /y "\\tsclient\D\MyProject\injdrv\bin\x64\Release\*" ".\*"
pause