@echo off
echo Building French Script... 
".\tools\putt\puttscript.exe" -e ".\text\fr\table.tbl" ".\text\fr\script.txt" ".\text\fr\script.bin"
echo.
echo Building French Items...
".\tools\putt\puttscript.exe" -e ".\text\fr\items_table.tbl" ".\text\fr\items.txt" ".\text\fr\items.bin"
echo.
echo Done.
pause