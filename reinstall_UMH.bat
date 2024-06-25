@echo off
setlocal

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo This script requires administrative privileges.
    pause
    exit /b 1
)

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
    set "ARCH=64"
) else if "%PROCESSOR_ARCHITECTURE%"=="IA64" (
    set "ARCH=64"
) else if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (
    set "ARCH=64"
) else (
    set "ARCH=32"
)
echo Running on %ARCH% bit system
if %ARCH% equ 64 (
    set "UmhPath=C:\20019\1.6.6400"
) else (
    set "UmhPath=C:\20019\1.6.3200"
)
echo UMH path is %UmhPath%

cd /d %~dp0
echo Running the script from %cd%
echo Copying TMUMHWrapperTester_Uninstall.ini
copy /y "C:\20019\TMUMHWrapperTester_Uninstall.ini" "C:\TMUMHWrapperTester.ini"
echo Running UMHTestTool
start /wait "UMHTestTool" "%UmhPath%\UMHTestTool.exe"
timeout /t 5
echo Deleting the files
del /s /q c:\windows\system32\drivers\tmumh.sys
rmdir /s /q c:\windows\system32\tmumh\
rmdir /s /q c:\windows\syswow64\tmumh\
timeout /t 5
echo Copying TMUMHWrapperTester.ini
copy /y "C:\20019\TMUMHWrapperTester.ini" "C:\TMUMHWrapperTester.ini"
echo Running UMHTestTool
start "UMHTestTool" "%UmhPath%\UMHTestTool.exe"
timeout /t 5
echo Adding the registry key RegUserCfgFlags "4"
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tmumh" /v "RegUserCfgFlags" /t REG_DWORD /d 4
echo Done

endlocal
pause
