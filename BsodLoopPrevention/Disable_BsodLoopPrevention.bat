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

set BsodLoopPreventionSwitch="GGCS"
set BsodLoopPreventionSwitchValue=0

echo.
echo Add the registry key Parameters if it does not exist
reg add "HKLM\SYSTEM\CurrentControlSet\Services\tmumh\Parameters" /f
if %errorLevel% NEQ 0 (
    echo Failed to add the registry key Parameters
    pause
    exit /b 1
)

echo Set the registry key %BsodLoopPreventionSwitch% to %BsodLoopPreventionSwitchValue%
reg add "HKLM\SYSTEM\CurrentControlSet\Services\tmumh\Parameters" /f /v %BsodLoopPreventionSwitch% /t REG_DWORD /d %BsodLoopPreventionSwitchValue%
echo Done

echo.
echo Query the registry key %BsodLoopPreventionSwitch%
reg query "HKLM\SYSTEM\CurrentControlSet\Services\tmumh\Parameters" /v %BsodLoopPreventionSwitch%
echo Done

endlocal
pause