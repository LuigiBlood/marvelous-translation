@echo off
echo Building English Script... 
".\tools\putt\puttscript.exe" -e ".\text\en_new\table.tbl" ".\text\en_new\script.txt" ".\text\en_new\script.bin"
echo.
echo Building English Items...
".\tools\putt\puttscript.exe" -e ".\text\en_new\items_table.tbl" ".\text\en_new\items.txt" ".\text\en_new\items.bin"
echo.
echo Done.
pause