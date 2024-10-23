cd /d %~dp0
sc stop tmais
testas driver call uninstall
testas driver call install
logman start tmais -pf providerGUID.txt -o tmais.etl -ets
logman start tmaismgr -p {9B13089A-A793-403A-A9D3-8A2050A38AB1} 0x7fffffff 5 -o tmaismgr.etl -ets
testTmAISMgr.exe
logman stop -n tmais -ets
logman stop -n tmaismgr -ets
@REM both TmAIS.sys and TmAISMgr.dll
@REM "C:\Program Files (x86)\Windows Kits\10\bin\10.0.22621.0\x64\tracefmt.exe"
tracefmt tmais.etl -r .\ -o tmais.log
@REM TmAISMgr.dll only
tracerpt -of csv -y tmaismgr.etl -o tmaismgr.log
pause