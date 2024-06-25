@echo off
setlocal

set "UmEvtRepoPath=D:\project"
set "UmEvtBuildX64Path=%UmEvtRepoPath%\Eyes\src\user\output\Releasex64"
set "UmEvtBuildWin32Path=%UmEvtRepoPath%\Eyes\src\user\output\Release"

if not exist "%UmEvtBuildX64Path%" (
    echo "Error: UMEVT build path not found: %UmEvtBuildX64Path%"
    exit /b 1
)

if not exist ".\binx64" (
    echo create directory .\binx64
    mkdir .\binx64
)

echo copy UMEVT build files to .\binx64

copy /y "%UmEvtBuildX64Path%\TmUmEvt64.dll" ".\binx64\TmUmEvt64.dll"
copy /y "%UmEvtBuildX64Path%\TmUmEvt64.pdb" ".\binx64\TmUmEvt64.pdb"

if exist %UmEvtBuildWin32Path% (
    copy /y "%UmEvtBuildWin32Path%\TmUmEvt.dll" ".\binx64\TmUmEvt.dll"
    copy /y "%UmEvtBuildWin32Path%\TmUmEvt.pdb" ".\binx64\TmUmEvt.pdb"
)

echo Done.

endlocal
pause