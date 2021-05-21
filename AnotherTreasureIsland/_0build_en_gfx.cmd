@echo off
echo Converting English Graphics...
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\camp_moves.png" -p ".\gfx\en_new\img\camp_moves.pal" -d ".\gfx\en_new\tmp\camp_moves.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\camp_moves.png" -p ".\gfx\en_new\img\camp_moves.pal" -t ".\gfx\en_new\tmp\camp_moves.gfx" -d ".\gfx\en_new\tmp\camp_moves.map" -T 512 -P 7

".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\camp_tips.png" -d ".\gfx\en_new\tmp\camp_tips.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\camp_tips.png" -p ".\gfx\en_new\tmp\camp_tips.pal" -d ".\gfx\en_new\tmp\camp_tips.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\camp_tips.png" -p ".\gfx\en_new\tmp\camp_tips.pal" -t ".\gfx\en_new\tmp\camp_tips.gfx" -d ".\gfx\en_new\tmp\camp_tips.map" -T 512 -P 7

".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\ship_note_tiles.png" -p ".\gfx\en_new\img\ship_note.pal" -d ".\gfx\en_new\tmp\ship_note_tiles.gfx" -D -T 128
echo Building English Graphics Files...
".\tools\bass\bass" ".\asm\graphics_en.asm"
echo Done.
pause