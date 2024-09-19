:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script requires administrative privileges.
    pause
    exit /b 1
)
cd /d %~dp0

reg add HKLM\SOFTWARE\TrendMicro\UMH /v DebugLogFlags /t REG_DWORD /d 0 /f /reg:64
pause