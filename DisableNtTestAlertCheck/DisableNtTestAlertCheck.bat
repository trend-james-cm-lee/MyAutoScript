@echo off
setlocal

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script requires administrative privileges.
    pause
    exit /b 1
)

echo Stop the service tmumh
sc stop tmumh
echo Query the service tmumh
sc query tmumh

set DisableNtTestAlertCheck=1

echo.
echo Set the registry key RegCfgFlags to %DisableNtTestAlertCheck%
reg add "HKLM\SYSTEM\CurrentControlSet\Services\tmumh" /v "RegCfgFlags" /t REG_DWORD /d %DisableNtTestAlertCheck% /f
if %errorLevel% NEQ 0 (
    echo Failed to set the registry key RegCfgFlags
    pause
    exit /b 1
)
echo Done

echo.
echo Query the registry key RegCfgFlags
reg query "HKLM\SYSTEM\CurrentControlSet\Services\tmumh" /v "RegCfgFlags"
if %errorLevel% NEQ 0 (
    echo Failed to query the registry key RegCfgFlags
    pause
    exit /b 1
)
echo Done

endlocal
pause