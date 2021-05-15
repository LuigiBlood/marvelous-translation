@echo off
echo Press any key to replace TransPutt script...
pause
echo Updating Script...
copy /y ".\text\en_new\table.tbl" ".\tools\putt\marvelous\eng_ver2_main\table.tbl"
copy /y ".\text\en_new\script.txt" ".\tools\putt\marvelous\eng_ver2_main\main.txt"
copy /y ".\text\en_new\script_notes.txt" ".\tools\putt\marvelous\eng_ver2_main\notes.txt"

copy /y ".\text\en_new\table.tbl" ".\tools\putt\marvelous\eng_ver2_items\table.tbl"
copy /y ".\text\en_new\items.txt" ".\tools\putt\marvelous\eng_ver2_items\main.txt"
copy /y ".\text\en_new\items_notes.txt" ".\tools\putt\marvelous\eng_ver2_items\notes.txt"
echo.
echo Done.
pause