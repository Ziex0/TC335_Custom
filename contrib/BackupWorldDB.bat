@ECHO OFF
TITLE WotLK Freeshard - Datenbank Backup
copy ".\Tools\Archiver\mysql.rn" "mysql.exe"
copy ".\Tools\Archiver\mysqldump.rn" "mysqldump.exe"

@ECHO OFF
TITLE TrinityCore: Datenbank Installation
COLOR 0B
CLS

:MYSQL
CLS
ECHO.
ECHO		Pfad zur MySQL Installation
ECHO.
SET /P mysql="MySQL: "
GOTO HOST

:HOST
CLS
ECHO.
ECHO		MySQL: %mysql%
ECHO.
ECHO		MySQL Server IP
ECHO.
SET /P svr="Host: "
GOTO USER

:USER
CLS
ECHO.
ECHO		 MySQL: %mysql%
ECHO		Server: %svr%
ECHO.
ECHO		MySQL Benutzername
ECHO.
SET /P user="Benutzer: "
GOTO PASS

:PASS
CLS
ECHO.
ECHO		   MySQL: %mysql%
ECHO		  Server: %svr%
ECHO		Benutzer: %user%
ECHO.
ECHO		MySQL Passwort
ECHO.
SET /P pass="Passwort: "
GOTO PORT

:PORT
CLS
ECHO.
ECHO		   MySQL: %mysql%
ECHO		  Server: %svr%
ECHO		Benutzer: %user%
ECHO		Passwort: %pass%
ECHO.
ECHO		MySQL Server Port
ECHO.
SET /P port="Port: "
GOTO DBA

:DBA
CLS
ECHO.
ECHO		   MySQL: %mysql%
ECHO		  Server: %svr%
ECHO		Benutzer: %user%
ECHO		Passwort: %pass%
ECHO		    Port: %port%
ECHO.
ECHO		Auth Datenbank
ECHO.
SET /P rdb="Auth DB: "
GOTO DBC

:DBC
CLS
ECHO.
ECHO		   MySQL: %mysql%
ECHO		  Server: %svr%
ECHO		Benutzer: %user%
ECHO		Passwort: %pass%
ECHO		    Port: %port%
ECHO		 Auth DB: %rdb%
ECHO.
ECHO		Auth Datenbank
ECHO.
SET /P cdb="Char DB: "
GOTO WDB

:WDB
CLS
ECHO.
ECHO		   MySQL: %mysql%
ECHO		  Server: %svr%
ECHO		Benutzer: %user%
ECHO		Passwort: %pass%
ECHO		    Port: %port%
ECHO		 Auth DB: %rdb%
ECHO		 Char DB: %cdb%
ECHO.
ECHO		Auth Datenbank
ECHO.
SET /P wdb="World DB: "
GOTO WDB1

:WDB1
CLS
ECHO.
ECHO		   MySQL: %mysql%
ECHO		  Server: %svr%
ECHO		Benutzer: %user%
ECHO		Passwort: %pass%
ECHO		    Port: %port%
ECHO		 Auth DB: %rdb%
ECHO		 Char DB: %cdb%
ECHO		World DB: %wdb%
ECHO.
ECHO.
PAUSE
GOTO WorldDB1

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
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=achievement_criteria_data
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=achievement_dbc
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=achievement_reward
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=achievement_reward_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=areatrigger_involvedrelation
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=areatrigger_scripts
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=areatrigger_tavern
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=areatrigger_teleport
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=battlefield_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=battleground_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=battlemaster_entry
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=broadcast_text
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=broadcast_text_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=command
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=conditions
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_addon
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_classlevelstats
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_default_trainer
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_equip_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_formations
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_model_info
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_movement_info
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_movement_override
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_onkill_reputation
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_questender
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_questitem
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_queststarter
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_summon_groups
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_addon
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_movement
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_outfits
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_resistance
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_template_spell
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_text
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=creature_text_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=disables
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=disenchant_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=event_scripts
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=exploration_basexp
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=fishing_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_addon
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_overrides
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_questender
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_questitem
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_queststarter
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_template_addon
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gameobject_template_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_arena_seasons
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_battleground_holiday
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_condition
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_creature
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_creature_quest
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_gameobject
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_gameobject_quest
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_model_equip
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_npcflag
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_npc_vendor
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_pool
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_prerequisite
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_quest_condition
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_event_seasonal_questrelation
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_tele
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=game_weather
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gossip_menu
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gossip_menu_option
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=gossip_menu_option_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=graveyard_zone
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=holiday_dates
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=instance_encounters
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=instance_spawn_groups
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=instance_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_enchantment_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_set_names
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_set_names_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=item_template_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=lfg_dungeon_rewards
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=lfg_dungeon_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=linked_respawn
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=mail_level_reward
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=mail_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=milling_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=npc_spellclick_spells
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=npc_text
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=npc_text_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=npc_vendor
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=outdoorpvp_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=page_text
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=page_text_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pet_levelstats
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pet_name_generation
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pickpocketing_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_action
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_cast_spell
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_item
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_skills
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=playercreateinfo_spell_custom
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_classlevelstats
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_achievement
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_items
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_quests
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_reputations
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_spells
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_factionchange_titles
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_levelstats
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_totem_model
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=player_xp_for_level
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=points_of_interest
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=points_of_interest_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pool_members
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=pool_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=prospecting_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_details
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_greeting
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_greeting_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_mail_sender
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_offer_reward
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_offer_reward_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_poi
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_poi_points
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_pool_members
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_pool_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_request_items
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_request_items_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_template_addon
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=quest_template_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=reference_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=reputation_reward_rate
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=reputation_spillover_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=script_spline_chain_meta
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=script_spline_chain_waypoints
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=script_waypoint
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skill_discovery_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skill_extra_item_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skill_fishing_base_level
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skill_perfect_item_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=skinning_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=smart_scripts
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spawn_group
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spawn_group_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spelldifficulty_dbc
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_area
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_bonus_data
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_custom_attr
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_dbc
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_enchant_proc_data
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_group
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_group_stack_rules
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_learn_spell
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_linked_spell
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_loot_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_pet_auras
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_proc
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_ranks
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_required
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_scripts
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_script_names
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_target_position
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=spell_threat
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=trainer
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=trainer_locale
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=trainer_spell
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=transports
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=trinity_string
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=updates
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=updates_include
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vehicle_accessory
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vehicle_seat_addon
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vehicle_template
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vehicle_template_accessory
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=version
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vw_conditions_with_labels
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vw_disables_with_labels
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=vw_smart_scripts_with_labels
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=warden_checks
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=waypoints
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=waypoint_data
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

SET TABLENAME=waypoint_scripts
echo             %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_worlddb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %wdb% %TABLENAME% >>  FullDatabase\_full_worlddb\%TABLENAME%.sql

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
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=account_instance_times
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=account_tutorial
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=addons
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=arena_team
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=arena_team_member
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=auctionbidders
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=auctionhouse
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=banned_addons
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=battleground_deserters
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=bugreport
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=calendar_events
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=calendar_invites
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=channels
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=characters
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_account_data
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_achievement
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_achievement_progress
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_action
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_arena_stats
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_aura
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_banned
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_battleground_data
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_battleground_random
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_declinedname
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_equipmentsets
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_fishingsteps
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_gifts
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_glyphs
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_homebind
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_instance
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_inventory
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_pet
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_pet_declinedname
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_daily
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_monthly
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_rewarded
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_seasonal
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_queststatus_weekly
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_reputation
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_skills
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_social
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_spell
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_spell_cooldown
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_stats
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=character_talent
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=corpse
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=custom_transmogrification
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=custom_transmogrification_sets
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=game_event_condition_save
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=game_event_save
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=gm_subsurvey
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=gm_survey
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=gm_ticket
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=groups
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=group_instance
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=group_member
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_bank_eventlog
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_bank_item
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_bank_right
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_bank_tab
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_eventlog
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_member
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_member_withdraw
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=guild_rank
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=instance
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=instance_reset
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_instance
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_loot_items
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_loot_money
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_refund_instance
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=item_soulbound_trade_data
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=lag_reports
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=lfg_data
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=mail
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=mail_items
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=petition
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=petition_sign
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pet_aura
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pet_spell
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pet_spell_cooldown
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pool_quest_save
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pvpstats_battlegrounds
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=pvpstats_players
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=quest_tracker
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=reserved_name
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=respawn
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=updates
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=updates_include
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=warden_action
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

SET TABLENAME=worldstates
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_chardb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_chardb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %cdb% %TABLENAME% >>  FullDatabase\_full_chardb\%TABLENAME%.sql

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
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=account_access
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=account_banned
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=account_muted
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=autobroadcast
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=build_info
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=ip_banned
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=logs
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=logs_ip_actions
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=rbac_account_permissions
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=rbac_default_permissions
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=rbac_linked_permissions
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=rbac_permissions
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=realmcharacters
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=realmlist
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=secret_digest
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=updates
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=updates_include
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=uptime
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=vw_log_history
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

SET TABLENAME=vw_rbac
echo Dumping.... %TABLENAME%
echo -- ---------------------------------------- >  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- --        CLEAR DOWN THE TABLE        -- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo TRUNCATE TABLE `%TABLENAME%`; >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
echo -- ---------------------------------------- >>  FullDatabase\_full_realmdb\%TABLENAME%.sql
mysqldump -Q -c -e -q -u%user% -p%pass% --port=%port% -h %svr% %rdb% %TABLENAME% >>  FullDatabase\_full_realmdb\%TABLENAME%.sql

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
echo ^|                               Database Backup Komplett                      ^|
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