@echo off
setlocal

set "UmhRepoPath=D:\project"
set "UmhBuildX64Path=%UmhRepoPath%\TMUMH_P4\src\binx64\Release"
set "UmhBuildWin32Path=%UmhRepoPath%\TMUMH_P4\src\binWin32\Release"
set "UmhInfPath=%UmhRepoPath%\TMUMH_P4\src\inf"

if not exist "%UmhBuildX64Path%" (
    echo "Error: UMH build path not found: %UmhBuildX64Path%"
    exit /b 1
)

if not exist ".\binx64" (
    echo create directory .\binx64
    mkdir .\binx64
)

echo copy UMH build files to .\binx64

copy /y "%UmhInfPath%\tmumh.inf" ".\binx64\tmumh.inf"
copy /y "%UmhBuildX64Path%\tmumh.sys" ".\binx64\tmumh.sys"
copy /y "%UmhBuildX64Path%\tmumh.pdb" ".\binx64\tmumh.pdb"

copy /y "%UmhBuildX64Path%\tmumhmgr.dll" ".\binx64\tmumhmgr.dll"
copy /y "%UmhBuildX64Path%\tmumhmgr.pdb" ".\binx64\tmumhmgr.pdb"

copy /y "%UmhBuildX64Path%\tmmon64.dll" ".\binx64\tmmon64.dll"
copy /y "%UmhBuildX64Path%\tmmon64.pdb" ".\binx64\tmmon64.pdb"

if exist %UmhBuildWin32Path% (
    copy /y "%UmhBuildWin32Path%\tmmon.dll" ".\binx64\tmmon.dll"
    copy /y "%UmhBuildWin32Path%\tmmon.pdb" ".\binx64\tmmon.pdb"
)

copy /y "%UmhBuildX64Path%\Titanium\plugAdapterTMUMH.dll" ".\binx64\plugAdapterTMUMH.dll"
copy /y "%UmhBuildX64Path%\Titanium\plugAdapterTMUMH.pdb" ".\binx64\plugAdapterTMUMH.pdb"

copy /y "%UmhBuildX64Path%\Titanium\helperTMUMHDriver.dll" ".\binx64\helperTMUMHDriver.dll"
copy /y "%UmhBuildX64Path%\Titanium\helperTMUMHDriver.pdb" ".\binx64\helperTMUMHDriver.pdb"

echo Done.

endlocal
pause