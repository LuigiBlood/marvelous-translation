@echo off
echo Assembling code... (English Version)
"./tools/bass/bass" build_ast_en.asm
echo Done.
echo Assembling code... (English PAL Version)
"./tools/bass/bass" build_ast_en_pal.asm
echo Done.
IF "%~1" == "" (timeout /t 10)
