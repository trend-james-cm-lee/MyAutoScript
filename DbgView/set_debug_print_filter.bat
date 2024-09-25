@echo off

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script requires administrative privileges.
    pause
    exit /b 1
)

echo Add the Debug Print Filter key if it does not exist
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /f
if %errorLevel% NEQ 0 (
    echo Failed to add the Debug Print Filter key
    pause
    exit /b 1
)

echo Set the registry key value DEFAULT under the Debug Print Filter key to 0xffffffff
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Debug Print Filter" /v "DEFAULT" /t REG_DWORD /d 0xffffffff /f

echo Registry key and value set successfully.
pause