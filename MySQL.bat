@echo off
COLOR F
echo ______________________Zaicopx Portable MySQL Server______________________
echo ______________________________MySQL 8.0.30_______________________________
echo.
echo MySQL is currently running. Please only close this window for shutdown.
echo Please disregard any InoDB messages that are prompted. They have no use.
echo After your server is shut off, press CTRL C to shut down this service.
mysql\bin\mysqld --standalone --console

if errorlevel 1 goto error
goto finish

:error
echo.
echo MySQL could not be started.
pause

:finish
