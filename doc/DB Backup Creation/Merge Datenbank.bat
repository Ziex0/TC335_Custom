@ECHO OFF
TITLE ERSTELLE KOMPLETTE WOW CLASSIC DATENBANK
COLOR 0A
copy /b FullDatabase\_full_worlddb\*.sql .\wotlk_world.sql
copy /b FullDatabase\_full_realmdb\*.sql .\wotlk_auth.sql
copy /b FullDatabase\_full_chardb\*.sql .\wotlk_characters.sql