@echo off
echo Converting English Graphics...
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\camp_moves.png" -p ".\gfx\en_new\img\camp_moves.pal" -d ".\gfx\en_new\tmp\camp_moves.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\camp_moves.png" -p ".\gfx\en_new\img\camp_moves.pal" -t ".\gfx\en_new\tmp\camp_moves.gfx" -d ".\gfx\en_new\tmp\camp_moves.map" -T 512 -P 7
echo Building English Graphics Files...
".\tools\bass\bass" ".\asm\graphics_en.asm"
echo Done.
pause