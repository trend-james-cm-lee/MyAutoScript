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

set "BinX64Path=TMUMH\Import\bin\x64\Release"
set "SymX64Path=TMUMH\Import\symbols\x64\Release"
set "BinWin32Path=TMUMH\Import\bin\Win32\Release"
set "SymWin32Path=TMUMH\Import\symbols\Win32\Release"

echo Extracting files from %ZipFilePath%
"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractToPath%" "%BinX64Path%\*" -aoa
"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractToPath%" "%SymX64Path%\*" -aoa
"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractToPath%" "%BinWin32Path%\tmmon.dll" -aoa
"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractToPath%" "%SymWin32Path%\tmmon.pdb" -aoa

echo Done.
endlocal
pause