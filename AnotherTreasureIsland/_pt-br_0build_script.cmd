@echo off
echo Building Brazilian Portuguese Script... 
".\tools\putt\puttscript.exe" -e ".\text\pt-br\table.tbl" ".\text\pt-br\script.txt" ".\text\pt-br\script.bin"
echo.
echo Building Brazilian Portuguese Items...
".\tools\putt\puttscript.exe" -e ".\text\pt-br\items_table.tbl" ".\text\pt-br\items.txt" ".\text\pt-br\items.bin"
echo.
echo Done.
IF "%~1" == "" (timeout /t 10)
