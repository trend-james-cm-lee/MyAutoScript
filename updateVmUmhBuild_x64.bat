@echo off
setlocal

set "UmhBuildX64Path=.\binx64"

if not exist "%UmhBuildX64Path%" (
    echo "Error: UMH build path not found: %UmhBuildX64Path%"
    exit /b 1
)

set "VmUmhPathX64=C:\20019\1.6.6400"
set "VmUmhSymPathX64=C:\20019\1.6.6400\symbols"

echo copy UMH build files to "%VmUmhPathX64%"
copy /y "%UmhBuildX64Path%\tmumh.inf" "%VmUmhPathX64%\tmumh.inf"
copy /y "%UmhBuildX64Path%\tmumh.sys" "%VmUmhPathX64%\tmumh.sys"
copy /y "%UmhBuildX64Path%\tmumh.pdb" "%VmUmhSymPathX64%\tmumh.pdb"

copy /y "%UmhBuildX64Path%\tmumhmgr.dll" "%VmUmhPathX64%\tmumhmgr.dll"
copy /y "%UmhBuildX64Path%\tmumhmgr.pdb" "%VmUmhSymPathX64%\tmumhmgr.pdb"

copy /y "%UmhBuildX64Path%\tmmon64.dll" "%VmUmhPathX64%\tmmon64.dll"
copy /y "%UmhBuildX64Path%\tmmon64.pdb" "%VmUmhSymPathX64%\tmmon64.pdb"

copy /y "%UmhBuildX64Path%\tmmon.dll" "%VmUmhPathX64%\tmmon.dll"
copy /y "%UmhBuildX64Path%\tmmon.pdb" "%VmUmhSymPathX64%\tmmon.pdb"

copy /y "%UmhBuildX64Path%\plugAdapterTMUMH.dll" "%VmUmhPathX64%\plugAdapterTMUMH.dll"
copy /y "%UmhBuildX64Path%\plugAdapterTMUMH.pdb" "%VmUmhSymPathX64%\plugAdapterTMUMH.pdb"

copy /y "%UmhBuildX64Path%\helperTMUMHDriver.dll" "%VmUmhPathX64%\helperTMUMHDriver.dll"
copy /y "%UmhBuildX64Path%\helperTMUMHDriver.pdb" "%VmUmhSymPathX64%\helperTMUMHDriver.pdb"

copy /y "%UmhBuildX64Path%\TmUmEvt64.dll" "%VmUmhPathX64%\Addon\TmUmEvt64.dll"
copy /y "%UmhBuildX64Path%\TmUmEvt64.pdb" "%VmUmhSymPathX64%\TmUmEvt64.pdb"

copy /y "%UmhBuildX64Path%\TmUmEvt.dll" "%VmUmhPathX64%\Addon\TmUmEvt.dll"
copy /y "%UmhBuildX64Path%\TmUmEvt.pdb" "%VmUmhSymPathX64%\TmUmEvt.pdb"

echo Done.

endlocal
pause