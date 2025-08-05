@echo off
echo Assembling code... (French Version)
"./tools/bass/bass" build_ast_fr.asm
echo Done.
echo Assembling code... (French PAL Version)
"./tools/bass/bass" build_ast_fr_pal.asm
echo Done.
pause