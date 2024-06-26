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

set "BinX64Path=Import\Titanium\bin\x64\Release"
set "SymX64Path=Import\Titanium\symbols\x64\Release"

echo Extracting files from %ZipFilePath%

"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractToPath%" "%BinX64Path%\*" -aoa
"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractToPath%" "%SymX64Path%\*" -aoa

echo Done.
endlocal
pause