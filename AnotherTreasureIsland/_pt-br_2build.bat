@echo off
echo Assembling code... (Brazilian Portuguese Version)
"./tools/bass/bass" build_ast_pt-br.asm
echo Done.
IF "%~1" == "" (timeout /t 10)
