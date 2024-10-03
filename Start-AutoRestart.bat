@echo off
title WoW Server Auto Restarter
set SERVER_INSTALL_LOCATION=%~dp0
set startUpRan = 0
:CheckStatus
:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
	IF "%%~L"=="" goto s_done
	Set _yyyy=%%L
	Set _mm=00%%J
	Set _dd=00%%G
	Set _hour=00%%H
	Set _minute=00%%I
	Set _second=00%%K
)
:s_done

:: Pad digits with leading zeros
Set _mm=%_mm:~-2%
Set _dd=%_dd:~-2%
Set _hour=%_hour:~-2%
Set _minute=%_minute:~-2%
Set _second=%_second:~-2%

Set LOGTIMESTAMP=%_yyyy%-%_mm%-%_dd%  %_hour%:%_minute%.%_second%
Set LOGTIMESTAMP_alt=%_yyyy%-%_mm%-%_dd%_%_hour%.%_minute%.%_second%

CLS
echo.
echo Check Status of WoW Server
echo.
timeout /t 2
tasklist | findstr -i mysqld.exe
::echo %errorlevel%
if %errorlevel% EQU 0 goto end1
	CLS
	cd "%SERVER_INSTALL_LOCATION%"
	start /min MySQL\bin\mysqld --console	
	echo MySQL server starting.
	timeout /t 5
:end1
CLS
tasklist | findstr -i authserver.exe
::echo %errorlevel%
if %errorlevel% EQU 0 goto end2
	CLS
	cd "%SERVER_INSTALL_LOCATION%"
	start "authserver.exe" "authserver.exe"	
	echo Auth server starting.
	timeout /t 5
:end2
CLS
tasklist | findstr -i worldserver.exe
::echo %errorlevel%
if %errorlevel% EQU 0 goto end3
	CLS
	if startUpRan EQU 0 goto skip1
		cd %SERVER_INSTALL_LOCATION%Logs
		if not exist "%SERVER_INSTALL_LOCATION%Logs\ReStarted_%LOGTIMESTAMP_alt%\" mkdir %SERVER_INSTALL_LOCATION%Logs\ReStarted_%LOGTIMESTAMP_alt%
			copy "Auth.log" "ReStarted_%LOGTIMESTAMP_alt%\Auth.log"
			copy "DBErrors.log" "ReStarted_%LOGTIMESTAMP_alt%\DBErrors.log"
			copy "Server.log" "ReStarted_%LOGTIMESTAMP_alt%\Server.log"
			timeout /t 1
	:skip1
	cd "%SERVER_INSTALL_LOCATION%"
	start "worldserver.exe" "worldserver.exe"	
	echo World server starting.
	timeout /t 5
:end3

CLS
echo.
echo WoW Server is running!
echo.
set startUpRan = 1
timeout /t 5
goto CheckStatus