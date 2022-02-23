@ECHO OFF
TITLE ERSTELLE 7ZIP ARCHIV VON DEN SQL DATEIEN
COLOR 9E
cd Archiver
copy 7z.rn ..\7z.exe
cd ..\
7z a WotLK-FullDB.7z ".\FullDatabase\"
del 7z.exe
rd /s /q FullDatabase\
ECHO.
ECHO	Entferne als letztes das Verzeichnis der SQL Dateien
ECHO.
ECHO.
ECHO	ERLEDIGT!
pause
