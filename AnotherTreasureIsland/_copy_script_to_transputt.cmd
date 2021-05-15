@echo off
echo Press any key to replace TransPutt script...
pause
echo Updating Script...
copy /y ".\text\en_new\table.tbl" ".\tools\putt\marvelous\eng_ver2_main\table.tbl"
copy /y ".\text\en_new\main.txt" ".\tools\putt\marvelous\eng_ver2_main\main.txt"

copy /y ".\text\en_new\table.tbl" ".\tools\putt\marvelous\eng_ver2_items\table.tbl"
copy /y ".\text\en_new\items.txt" ".\tools\putt\marvelous\eng_ver2_items\items.txt"
echo.
echo Done.
pause