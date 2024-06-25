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

set "ZipFileX64=TMUMH_x64.zip"
set "ZipFileWin32=TMUMH_Win32.zip"

echo Extracting files from %ZipFilePath%
"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractTempPath%" "%ZipFileX64%" -aoa
"%SevenZipPath%" e "%ZipFilePath%" -o"%ExtractTempPath%" "%ZipFileWin32%" -aoa

set "BinX64Path=Import\TMUMH\bin\x64\Release"
set "SymX64Path=Import\TMUMH\symbols\x64\Release"
set "BinWin32Path=Import\TMUMH\bin\Win32\Release"
set "SymWin32Path=Import\TMUMH\symbols\Win32\Release"
set "AdapterX64Path=Import\Titanium\bin\x64\Release"
set "AdapterSymX64Path=Import\Titanium\symbols\x64\Release"
set "TestToolX64Path=UMHTestTool\Titanium"

"%SevenZipPath%" e "%ExtractTempPath%\%ZipFileX64%" -o"%ExtractToPath%" "%BinX64Path%\*" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFileX64%" -o"%ExtractToPath%" "%SymX64Path%\*" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFileWin32%" -o"%ExtractToPath%" "%BinWin32Path%\tmmon.dll" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFileWin32%" -o"%ExtractToPath%" "%SymWin32Path%\tmmon.pdb" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFileX64%" -o"%ExtractToPath%" "%AdapterX64Path%\*" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFileX64%" -o"%ExtractToPath%" "%AdapterSymX64Path%\*" -aoa
"%SevenZipPath%" e "%ExtractTempPath%\%ZipFileWin32%" -o"%ExtractToPath%" "%TestToolX64Path%\*" -aoa

echo Cleaning up temporary files: %ZipFileX64% and %ZipFileWin32%
del "%ExtractTempPath%\%ZipFileX64%"
del "%ExtractTempPath%\%ZipFileWin32%"

echo Done.
endlocal
pause