@ECHO OFF
TITLE WotLK Freeshard - Datenbank Backup
copy "Archiver\mysql.rn" "mysql.exe"
copy "Archiver\mysqldump.rn" "mysqldump.exe"
rem -- set the main parameters
set createcharDB=YES
set createworldDB=YES
set createrealmDB=YES
set createwebDB=YES

set loadcharDB=YES
set loadworldDB=YES
set loadrealmDB=YES
set loadwebDB=YES
set DBType=POPULATED
set activity=@

set locFR=NO
set locES=NO
set locDE=NO
set viacommandline=NO

rem -- Change the values below to match your server --
set mysql=
set svr=127.0.0.1
set user=root
set pass=root
set port=3306
set wdb=wotlk_world
set wdborig=mangos0
set cdb=wotlk_chars
set cdborig=character0
set rdb=wotlk_auth
set rdborig=realmd
set webdb=wotlk_web
set webdborig=web0


SET servername=%1
if %servername%. NEQ . goto parameters:
goto main

:parameters
if %servername% == HELP goto parametersbanners:
goto processparams

:parametersbanners
CLS
echo %colWhiteBold%_______________________________________________________________________________
echo %colWhiteDarkBlue%^|    __  __      _  _  ___  ___  ___                                          ^|
echo ^|   ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|                                         ^|
echo ^|   ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \                                         ^|
echo ^|   ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/ %colYellowBold%Database Backup v1.1                %colWhiteBold%    ^|
echo ^|_____________________________________________________________________________^|
echo %colWhiteLightBlue%^|                                                                             ^|
echo ^|   Website / Forum / Wiki / Support: https://getmangos.eu                    ^|
echo ^|_____________________________________________________________________________^|%colReset%
echo %colWhiteBold%^|                                                                             ^|
echo %colWhiteBold%^|  
echo.
ECHO.
echo  Parameters:
echo.
echo  backupDB {servername} {username} {password} {port} {worlddbname}
echo           {wdbStruct} {chardbname} {cdbStruct} {realmdbname} {rdbStruct}
echo.
echo  Where    {servername}  - The name or ip address of the server
echo           {username}    - Username to use
echo           {password}    - Password to use
echo           {port}        - Port to access the server
echo           {worlddbname} - Name of the World Database
echo           {wdbStruct}   - Backup the Structure as part of the backup (YES/NO)
echo           {chardbname}  - Name of the Character Database
echo           {cdbStruct}   - Backup the Structure as part of the backup (YES/NO)
echo           {realmdbname} - Name of the Realm Database
echo           {rdbStruct}   - Backup the Structure as part of the backup (YES/NO)

echo  e.g.
echo.
echo  backupDB mangosserver root mangos 3306 mangos0 YES character0 YES realmd YES
echo.
goto finish

:processparams
set svr=%1
set user=%2
set pass=%3
set port=%4
set wdb=%5
set cdb=%7
set rdb=%9
set loadworldDB=%6
set loadcharDB=%8
shift /1
set loadrealmDB=%9
set viacommandline=YES

echo.
echo  backupDB %svr% %user% %pass% %port% %wdb% %loadworldDB% %cdb% %loadcharDB% %rdb% %loadrealmDB%
echo.
rem pause
rem goto finish


rem -- Don't change past this point --
rem setlocal
:main
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.3" echo Windows 8.1
if "%version%" == "6.2" echo Windows 8.
if "%version%" == "6.1" echo Windows 7.
if "%version%" == "6.0" echo Windows Vista.
if "%version%" == "10.0" echo Windows 10.

if "%version%" == "10.0" goto setColours:
goto setOptions:

:setColours
set colReset=[0m
set colYellow=[33m
set colYellowBold=[93m
set colWhiteBold=[97m
set colWhiteDarkBlue=[97;44m
set colWhiteLightBlue=[97;104m
set colWhiteLightGreen=[97;42m
set colCyanBold=[96m
set colCyan=[36m
set colWhite=[37m
set colMagentaBold=[95m
set colMagenta=[35m
set colRedBold=[91m
set colRed=[31m
set colGreenBold=[92m
set colGreen=[32m
set colWhiteDarkRed=[97;101m
set colBold=[101m
set colWhiteDarkYellow=[97;43m


:setOptions
rem If running from the commandline, skip the asking for params
if %viacommandline% == YES goto Step1:
CLS

echo %colWhiteBold%_______________________________________________________________________________
echo %colWhiteDarkBlue%^|    __  __      _  _  ___  ___  ___                                          ^|
echo ^|   ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|                                         ^|
echo ^|   ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \                                         ^|
echo ^|   ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/ %colYellowBold%Database Backup v1.0                %colWhiteBold%    ^|
echo ^|_____________________________________________________________________________^|
echo %colWhiteLightBlue%^|                                                                             ^|
echo ^|   Website / Forum / Wiki / Support: https://getmangos.eu                    ^|
echo ^|_____________________________________________________________________________^|%colReset%
echo %colWhiteBold%^|                                                                             ^|
echo %colWhiteBold%^|                                                                             ^|

if %createcharDB% == NO set PAD= 
if %createcharDB% == YES set PAD=
echo %colWhiteBold%^|    Character Database : V -%colWhite% Backup DB (%colYellowBold%%createcharDB%%colWhite%)%PAD%                                 %colWhiteBold%^|

if %loadcharDB% == NO set PAD= 
if %loadcharDB% == YES set PAD=
echo %colWhiteBold%^|                         C -%colWhite% Include DB Structure (%colYellowBold%%loadcharDB%%colWhite%)%PAD%                      %colWhiteBold%^|
echo %colWhiteBold%^|                                                                             ^|

if %createworldDB% == NO set PAD= 
if %createworldDB% == YES set PAD=
echo %colWhiteBold%^|        %colYellowBold%World Database : E -%colYellow% Backup DB (%colWhiteBold%%createworldDB%%colYellow%)%PAD%                                 %colWhiteBold%^|

if %loadworldDB% == NO set PAD= 
if %loadworldDB% == YES set PAD=
echo %colWhiteBold%^|                         %colYellowBold%W -%colYellow% Include DB Structure (%colWhiteBold%%loadworldDB%%colYellow%)%PAD%                      %colWhiteBold%^|
echo %colWhiteBold%^|                                                                             ^|

if %createrealmDB% == NO set PAD= 
if %createrealmDB% == YES set PAD=
echo %colWhiteBold%^|        %colCyanBold%Realm Database : T -%colCyan% Back DB (%colWhiteBold%%createrealmDB%%colCyan%)%PAD%                                   %colWhiteBold%^|

if %loadrealmDB% == NO set PAD= 
if %loadrealmDB% == YES set PAD=
echo %colWhiteBold%^|                         %colCyanBold%R -%colCyan% Include DB Structure (%colWhiteBold%%loadrealmDB%%colCyan%)%PAD%                      %colWhiteBold%^|
echo %colWhiteBold%^|                                                                             ^|
echo %colWhiteBold%^|                         %colGreenBold%N -%colGreen% Next Step%colWhiteBold%                                       ^|
echo %colWhiteBold%^|                         X - %colWhite%Exit%colWhiteBold%                                            ^|
echo %colWhiteBold%^|                                                                             ^|
echo %colWhiteBold%^|    %colRedBold%Type backupDB HELP to display commandline options%colWhiteBold%                        ^|
echo %colWhiteBold%^|                                                                             ^|
echo %colWhiteBold%^|_____________________________________________________________________________^|%colReset%
echo.


set /p activity=. Please select an activity ? : 
if %activity% == V goto ToggleCharDB:
if %activity% == v goto ToggleCharDB:
if %activity% == E goto ToggleWorldDB:
if %activity% == e goto ToggleWorldDB:
if %activity% == T goto ToggleRealmDB:
if %activity% == t goto ToggleRealmDB:
if %activity% == C goto LoadCharDB:
if %activity% == c goto LoadCharDB:
if %activity% == W goto LoadWorldDB:
if %activity% == w goto LoadWorldDB:
if %activity% == R goto LoadRealmDB:
if %activity% == r goto LoadRealmDB:

if %activity% == N goto Step1:
if %activity% == n goto Step1:

if %activity% == X goto done:
if %activity% == x goto done:
if %activity%. == . goto main:
if %activity% == . goto main:
goto main:


:ToggleCharDB
if %createcharDB% == NO goto ToggleCharDBNo:
if %createcharDB% == YES goto ToggleCharDBYes:
goto main:

:ToggleCharDBNo
set createcharDB=YES
goto main:

:ToggleCharDBYes
set createcharDB=NO
goto main:

:ToggleWorldDB
if %createworldDB% == NO goto ToggleWorldDBNo:
if %createworldDB% == YES goto ToggleWorldDBYes:
goto main:

:ToggleWorldDBNo
set createworldDB=YES
goto main:

:ToggleWorldDBYes
set createworldDB=NO
goto main:

:ToggleRealmDB
if %createrealmDB% == NO goto ToggleRealmDBNo:
if %createrealmDB% == YES goto ToggleRealmDBYes:
goto main:

:ToggleRealmDBNo
set createrealmDB=YES
goto main:

:ToggleRealmDBYes
set createrealmDB=NO
goto main:

:LoadCharDB
if %loadcharDB% == NO goto LoadCharDBNo:
if %loadcharDB% == YES goto LoadCharDBYes:
goto main:

:LoadCharDBNo
set loadcharDB=YES
goto main:

:LoadCharDBYes
set loadcharDB=NO
goto main:

:LoadWorldDB
if %loadworldDB% == NO goto LoadWorldDBNo:
if %loadworldDB% == YES goto LoadWorldDBYes:
goto main:

:LoadWorldDBNo
set loadworldDB=YES
goto main:

:LoadWorldDBYes
set loadworldDB=NO
goto main:

:LoadRealmDB
if %loadrealmDB% == NO goto LoadRealmDBNo:
if %loadrealmDB% == YES goto LoadRealmDBYes:
goto main:

:LoadRealmDBNo
set loadrealmDB=YES
goto main:

:LoadRealmDBYes
set loadrealmDB=NO
goto main:

:Step1
if not exist %mysql%mysql.exe goto patherror:
rem If running from the commandline, skip the asking for params
if %viacommandline% == YES goto WorldDB:

CLS
echo %colWhiteBold%_______________________________________________________________________________
echo %colWhiteDarkBlue%^|    __  __      _  _  ___  ___  ___                                          ^|
echo ^|   ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|                                         ^|
echo ^|   ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \                                         ^|
echo ^|   ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/ %colYellowBold%Database Backup                     %colWhiteBold%    ^|
echo ^|_____________________________________________________________________________^|
echo %colWhiteLightBlue%^|                                                                             ^|
echo ^|   Website / Forum / Wiki / Support: https://getmangos.eu                    ^|
echo ^|_____________________________________________________________________________^|%colReset%
echo.
echo.
set /p svr=. What is your MySQL host name?           [%svr%] : 
if %svr%. == . set svr=localhost
set /p user=. What is your MySQL user name?                [%user%] : 
if %user%. == . set user=root
set /p pass=. What is your MySQL password?               [%pass%] : 
if %pass%. == . set pass=mangos
set /p port=. What is your MySQL port?                     [%port%] : 
if %port%. == . set port=3306

set showChar=0
if %createcharDB% == YES set showChar=1
REM if %loadcharDB% == YES set showChar=1

if %showChar% == 1 set /p cdb=. What is your Character database name?  [%cdb%] : 
if %cdb%. == . set cdb=%cdborig%

set showWorld=0
if %createworldDB% == YES set showWorld=1
REM if %loadworldDB% == YES set showWorld=1
if %showWorld% == 1 set /p wdb=. What is your World database name?         [%wdb%] : 
if %wdb%. == . set wdb=%wdborig%

set showRealm=0
if %createrealmDB% == YES set showRealm=1
REM if %loadrealmDB% == YES set showRealm=1

if %showRealm% == 1 set /p rdb=. What is your Realm database name?          [%rdb%] : 
if %rdb%. == . set rdb=%rdborig%

color 02

:WorldDB
REM ##### IF createworlddb = YES then create the DB
if %loadworldDB% == NO set extraparams=--add-drop-table=false --no-create-info 
if %createworldDB% == YES goto WorldDB1:
if %loadworldDB% == YES goto WorldDB1:

:CharDB
REM ##### IF createchardb = YES then create the DB
set extraparams=
if %loadcharDB% == NO set extraparams=--add-drop-table=false --no-create-info 
if %loadcharDB% == YES goto CharDB1:
if %createcharDB% == YES goto CharDB1:

:RealmDB
REM ##### IF createrealmdb = YES then create the DB
set extraparams=
if %loadrealmDB% == NO set extraparams=--add-drop-table=false --no-create-info 
if %createrealmDB% == YES goto RealmDB1:
if %loadrealmDB% == YES goto RealmDB1:

goto done:

:WorldDB1
if exist _full_worlddb goto WorldDBSkip1:
md FullDatabase\_full_worlddb
:WorldDBSkip1
echo %colWhiteBold%_______________________________________________________________________________
echo %colWhiteDarkYellow%^|                                                                             ^|
echo ^|                                                                             ^|
echo ^| Dumping World Database                                                      ^|
echo ^|                                                                             ^|
echo ^|_____________________________________________________________________________^|%colReset%
echo.

SET TABLENAME=access_requirement
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=achievement_criteria_data
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=achievement_dbc
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=achievement_reward
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=achievement_reward_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=areatrigger_involvedrelation
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=areatrigger_scripts
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=areatrigger_tavern
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=areatrigger_teleport
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=battlefield_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=battleground_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=battlemaster_entry
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=broadcast_text
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=broadcast_text_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=command
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=conditions
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_addon
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_classlevelstats
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_default_trainer
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_equip_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_formations
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_model_info
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_movement_info
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_movement_override
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_onkill_reputation
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_questender
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_questitem
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_queststarter
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_summon_groups
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_addon
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_movement
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_outfits
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_resistance
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_spell
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_text
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_text_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=disables
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=disenchant_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=event_scripts
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=exploration_basexp
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=fishing_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_addon
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_overrides
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_questender
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_questitem
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_queststarter
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_template_addon
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_template_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_arena_seasons
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_battleground_holiday
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_condition
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_creature
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_creature_quest
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_gameobject
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_gameobject_quest
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_model_equip
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_npcflag
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_npc_vendor
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_pool
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_prerequisite
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_quest_condition
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_seasonal_questrelation
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_tele
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_weather
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gossip_menu
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gossip_menu_option
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gossip_menu_option_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=graveyard_zone
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=holiday_dates
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=instance_encounters
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=instance_spawn_groups
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=instance_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_enchantment_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_set_names
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_set_names_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_template_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=lfg_dungeon_rewards
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=lfg_dungeon_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=linked_respawn
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=mail_level_reward
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=mail_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=milling_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=npc_spellclick_spells
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=npc_text
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=npc_text_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=npc_vendor
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=outdoorpvp_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=page_text
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=page_text_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pet_levelstats
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pet_name_generation
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pickpocketing_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_action
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_cast_spell
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_item
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_skills
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_spell_custom
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_classlevelstats
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_achievement
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_items
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_quests
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_reputations
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_spells
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_titles
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_levelstats
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_totem_model
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_xp_for_level
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=points_of_interest
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=points_of_interest_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pool_members
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pool_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=prospecting_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_details
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_greeting
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_greeting_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_mail_sender
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_offer_reward
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_offer_reward_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_poi
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_poi_points
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_pool_members
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_pool_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_request_items
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_request_items_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_template_addon
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_template_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=reference_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=reputation_reward_rate
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=reputation_spillover_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=script_spline_chain_meta
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=script_spline_chain_waypoints
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=script_waypoint
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skill_discovery_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skill_extra_item_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skill_fishing_base_level
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skill_perfect_item_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skinning_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=smart_scripts
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spawn_group
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spawn_group_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spelldifficulty_dbc
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_area
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_bonus_data
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_custom_attr
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_dbc
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_enchant_proc_data
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_group
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_group_stack_rules
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_learn_spell
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_linked_spell
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_loot_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_pet_auras
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_proc
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_ranks
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_required
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_scripts
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_script_names
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_target_position
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_threat
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=trainer
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=trainer_locale
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=trainer_spell
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=transports
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=trinity_string
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=updates
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=updates_include
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vehicle_accessory
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vehicle_seat_addon
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vehicle_template
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vehicle_template_accessory
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=version
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vw_conditions_with_labels
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vw_disables_with_labels
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vw_smart_scripts_with_labels
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=warden_checks
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=waypoints
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=waypoint_data
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=waypoint_scripts
echo             %TABLENAME%
if %loadworldDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
if %loadworldDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

goto CharDB:

:CharDB1
REM ############ CHAR DB DUMP STUFF HERE ###########
if exist _full_chardb goto CharDBSkip1:
md FullDatabase\_full_chardb
:CharDBSkip1
echo %colWhiteBold%_______________________________________________________________________________
echo %colWhiteDarkYellow%^|                                                                             ^|
echo ^|                                                                             ^|
echo ^| Dumping Character Database                                                  ^|
echo ^|                                                                             ^|
echo ^|_____________________________________________________________________________^|%colReset%
echo.

SET TABLENAME=account_data
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=account_instance_times
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=account_tutorial
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=addons
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=arena_team
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=arena_team_member
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=auctionbidders
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=auctionhouse
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=banned_addons
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=battleground_deserters
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=bugreport
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=calendar_events
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=calendar_invites
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=channels
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=characters
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_account_data
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_achievement
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_achievement_progress
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_action
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_arena_stats
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_aura
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_banned
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_battleground_data
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_battleground_random
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_declinedname
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_equipmentsets
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_fishingsteps
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_gifts
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_glyphs
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_homebind
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_instance
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_inventory
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_pet
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_pet_declinedname
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_daily
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_monthly
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_rewarded
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_seasonal
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_weekly
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_reputation
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_skills
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_social
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_spell
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_spell_cooldown
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_stats
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_talent
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=char_proposal
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=char_trade_logs
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=corpse
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=custom_transmogrification
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=custom_transmogrification_sets
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=game_event_condition_save
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=game_event_save
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=gm_subsurvey
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=gm_survey
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=gm_ticket
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=groups
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=group_instance
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=group_member
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_bank_eventlog
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_bank_item
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_bank_right
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_bank_tab
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_eventlog
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_member
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_member_withdraw
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_rank
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=instance
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=instance_reset
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_instance
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_loot_items
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_loot_money
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_refund_instance
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_soulbound_trade_data
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=lag_reports
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=lfg_data
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=mail
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=mail_items
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=petition
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=petition_sign
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pet_aura
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pet_spell
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pet_spell_cooldown
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pool_quest_save
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pvpstats_battlegrounds
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pvpstats_players
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=quest_tracker
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=reserved_name
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=respawn
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=submited_chars
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=updates
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=updates_include
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=warden_action
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=worldstates
echo Dumping.... %TABLENAME%
if %loadcharDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
if %loadcharDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql
goto RealmDB:

:RealmDB1
REM ############ REALM DB DUMP STUFF HERE ###########
if exist _full_realmdb goto RealmDBSkip1:
md FullDatabase\_full_realmdb
:RealmDBSkip1
echo %colWhiteBold%_______________________________________________________________________________
echo %colWhiteDarkYellow%^|                                                                             ^|
echo ^|                                                                             ^|
echo ^| Dumping Realm Database                                                      ^|
echo ^|                                                                             ^|
echo ^|_____________________________________________________________________________^|%colReset%
echo.

SET TABLENAME=account
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=account_access
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=account_banned
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=account_muted
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=autobroadcast
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=build_info
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=ip_banned
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=logs
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=logs_ip_actions
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=rbac_account_permissions
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=rbac_default_permissions
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=rbac_linked_permissions
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=rbac_permissions
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=realmcharacters
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=realmlist
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=secret_digest
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=updates
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=updates_include
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=uptime
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=vw_log_history
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=vw_rbac
echo Dumping.... %TABLENAME%
if %loadrealmDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
if %loadrealmDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

goto WebDB1:

:WebDB1
if exist _full_webdb goto WebDBSkip1:
md FullDatabase\_full_webdb
:WebDBSkip1
echo %colWhiteBold%_______________________________________________________________________________
echo %colWhiteDarkYellow%^|                                                                             ^|
echo ^|                                                                             ^|
echo ^| Dumping Web Database                                                      ^|
echo ^|                                                                             ^|
echo ^|_____________________________________________________________________________^|%colReset%
echo.


SET TABLENAME=account_data
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=acl_account_groups
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=acl_account_permissions
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=acl_account_roles
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=acl_groups
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=acl_group_roles
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=acl_roles
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=acl_roles_permissions
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=articles
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=article_tag
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=banlist_pics
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=changelog
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=changelog_type
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=char_proposal
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=char_trade_logs
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=ci_sessions
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=comments
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=daily_signups
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_achievement
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_achievement_category
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_gemproperties
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_glyphproperties
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_itemdisplayinfo
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_itemset
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_itemsetnames
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_spell
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_spellcasttimes
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_spellduration
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_spellicons
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_spellitemenchantment
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_spellitemenchantmentcondition
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_spellradius
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_spellrange
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_spellrunecost
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_talent
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=data_wotlk_talenttab
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=image_slider
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=item_display
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=logs
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=menu
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=menu_ucp
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=monthly_income
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=monthly_votes
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=order_log
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=pages
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=password_recovery_key
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=paygol_logs
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=paypal_logs
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=pending_accounts
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=private_message
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=ranks
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=realms
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=recruit_a_friend_claimed
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=shouts
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=sideboxes
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=sideboxes_custom
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=sideboxes_poll_answers
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=sideboxes_poll_questions
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=sideboxes_poll_votes
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=spelltext_en
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=store_groups
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=store_items
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=submited_chars
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=tag
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=teleport_locations
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=visitor_log
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=vote_log
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

SET TABLENAME=vote_sites
echo Dumping.... %TABLENAME%
if %loadwebDB% == NO echo -- ---------------------------------------- >  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_webdb\%TABLENAME%.sql
if %loadwebDB% == NO echo -- ---------------------------------------- >>  FullDatabase\_full_webdb\%TABLENAME%.sql
mysqldump -Q -c -e -q %extraparams% -u%user% -p%pass% --port=%port% -h %svr% %webdb% %TABLENAME% >>  FullDatabase\_full_webdb\%TABLENAME%.sql

goto done:


:patherror
echo.
echo _______________________________________________________________________________
echo %colWhiteDarkRed%^|                                                                             ^|
echo ^|                                                                             ^|
echo ^|                           Cannot find required files.                       ^|
echo ^|                                                                             ^|
echo %colWhiteBold%^|_____________________________________________________________________________^|
echo.
goto finish:

:error
echo.
echo _______________________________________________________________________________
echo %colWhiteDarkRed%^|                                                                             ^|
echo ^|                                                                             ^|
echo ^|                           Install Database Process Failed                   ^|
echo ^|                                                                             ^|
echo %colWhiteBold%^|_____________________________________________________________________________^|
echo.
goto finish:

:done
color 08
echo %colWhiteBold%_______________________________________________________________________________
echo %colWhiteDarkBlue%^|    __  __      _  _  ___  ___  ___                                          ^|
echo ^|   ^|  \/  ^|__ _^| \^| ^|/ __^|/ _ \/ __^|                                         ^|
echo ^|   ^| ^|\/^| / _` ^| .` ^| (_ ^| (_) \__ \                                         ^|
echo ^|   ^|_^|  ^|_\__,_^|_^|\_^|\___^|\___/^|___/ %colYellowBold%Database Backup                     %colWhiteBold%    ^|
echo ^|_____________________________________________________________________________^|
echo %colWhiteLightGreen%^|                                                                             ^|
echo ^|                                                                             ^|
echo ^|                               Database Backup Complete                      ^|
echo ^|                                                                             ^|
echo %colWhiteBold%^|_____________________________________________________________________________^|
echo.
echo Alle Aufgaben wurden abgeschlossen...
echo.
echo.
del "mysql.exe"
del "mysqldump.exe"
echo.
:finish
pause