@echo off
setlocal

set "ZipFilePath=%~1"
echo ZipFilePath is %ZipFilePath%
if "%ZipFilePath%"=="" (
    echo Error: No ZIP file specified.
    exit /b 1
)

set "SevenZipPath=C:\Program Files\7-Zip\7z.exe"
if not exist "%SevenZipPath%" (
    set "SevenZipPath=C:\Program Files (x86)\7-Zip\7z.exe"
    if not exist "%SevenZipPath%" (
        echo Error: 7-Zip not found.
        exit /b 1
    )
)

cd /d %~dp0
set "ExtractTempPath=%cd%"
set "ExtractToPath=%cd%\binx64"
if not exist "%ExtractToPath%" mkdir "%ExtractToPath%"
echo Extracting to %ExtractToPath%

set "ZipFile=ACUSER_RELEASE.zip"


echo Extracting files from %ZipFilePath%

"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractTempPath%" "win64\%ZipFile%" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFile%" -o"%ExtractToPath%" "TmUmEvt64.dll" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFile%" -o"%ExtractToPath%" "TmUmEvt64.pdb" -aoa
del "%ExtractTempPath%\%ZipFile%"

"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractTempPath%" "win32\%ZipFile%" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFile%" -o"%ExtractToPath%" "TmUmEvt.dll" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFile%" -o"%ExtractToPath%" "TmUmEvt.pdb" -aoa
del "%ExtractTempPath%\%ZipFile%"

echo Done.
endlocal
pause