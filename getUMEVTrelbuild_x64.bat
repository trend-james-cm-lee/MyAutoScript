@echo off
setlocal

set "ZipFilePath=%~1"
echo ZipFilePath is %ZipFilePath%
if "%ZipFilePath%"=="" (
    echo Error: No ZIP file specified.
    exit /b 1
)

cd /d %~dp0
set "ExtractToPath=%cd%\binx64"
if not exist "%ExtractToPath%" mkdir "%ExtractToPath%"
echo Extracting to %ExtractToPath%

set "SevenZipPath=C:\Program Files\7-Zip\7z.exe"
if not exist "%SevenZipPath%" (
    set "SevenZipPath=C:\Program Files (x86)\7-Zip\7z.exe"
    if not exist "%SevenZipPath%" (
        echo Error: 7-Zip not found.
        exit /b 1
    )
)

set "DllX64Path=Dll\win64\release"
set "DllWin32Path=Dll\win32\release"

echo Extracting files from %ZipFilePath%

"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractToPath%" "%DllX64Path%\TmUmEvt64.*" -aoa
"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractToPath%" "%DllWin32Path%\TmUmEvt.*" -aoa

echo Done.
endlocal
pause