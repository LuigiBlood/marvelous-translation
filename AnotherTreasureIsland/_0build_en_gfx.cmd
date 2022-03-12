@echo off
echo Converting English Graphics...
echo - camp_moves.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\camp_moves.png" -p ".\gfx\en_new\img\camp_moves.pal" -d ".\gfx\en_new\tmp\camp_moves.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\camp_moves.png" -p ".\gfx\en_new\img\camp_moves.pal" -t ".\gfx\en_new\tmp\camp_moves.gfx" -d ".\gfx\en_new\tmp\camp_moves.map" -T 512 -P 7
echo - camp_tips.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\camp_tips.png" -d ".\gfx\en_new\tmp\camp_tips.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\camp_tips.png" -p ".\gfx\en_new\tmp\camp_tips.pal" -d ".\gfx\en_new\tmp\camp_tips.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\camp_tips.png" -p ".\gfx\en_new\tmp\camp_tips.pal" -t ".\gfx\en_new\tmp\camp_tips.gfx" -d ".\gfx\en_new\tmp\camp_tips.map" -T 512 -P 7
echo - ship_note_tiles.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\ship_note_tiles.png" -p ".\gfx\en_new\img\ship_note.pal" -d ".\gfx\en_new\tmp\ship_note_tiles.gfx" -D -T 128
echo - gina_ransom_letter.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\gina_ransom_letter.png" -d ".\gfx\en_new\tmp\gina_ransom_letter.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\gina_ransom_letter.png" -p ".\gfx\en_new\tmp\gina_ransom_letter.pal" -d ".\gfx\en_new\tmp\gina_ransom_letter.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\gina_ransom_letter.png" -p ".\gfx\en_new\tmp\gina_ransom_letter.pal" -t ".\gfx\en_new\tmp\gina_ransom_letter.gfx" -d ".\gfx\en_new\tmp\gina_ransom_letter.map" -T 512 -P 7
echo - patchies_stuck_note.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\patchies_stuck_note.png" -d ".\gfx\en_new\tmp\patchies_stuck_note.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\patchies_stuck_note.png" -p ".\gfx\en_new\tmp\patchies_stuck_note.pal" -d ".\gfx\en_new\tmp\patchies_stuck_note.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\patchies_stuck_note.png" -p ".\gfx\en_new\tmp\patchies_stuck_note.pal" -t ".\gfx\en_new\tmp\patchies_stuck_note.gfx" -d ".\gfx\en_new\tmp\patchies_stuck_note.map" -T 512 -P 7
echo - the_monster_bg.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\the_monster_bg.png" -p ".\gfx\en_new\img\the_monster_bg.pal" -d ".\gfx\en_new\tmp\the_monster_bg.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\the_monster_bg.png" -p ".\gfx\en_new\img\the_monster_bg.pal" -t ".\gfx\en_new\tmp\the_monster_bg.gfx" -d ".\gfx\en_new\tmp\the_monster_bg.map" -T 512 -P 7
echo - chore_list.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\chore_list.png" -d ".\gfx\en_new\tmp\chore_list.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\chore_list.png" -p ".\gfx\en_new\tmp\chore_list.pal" -d ".\gfx\en_new\tmp\chore_list.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\chore_list.png" -p ".\gfx\en_new\tmp\chore_list.pal" -t ".\gfx\en_new\tmp\chore_list.gfx" -d ".\gfx\en_new\tmp\chore_list.map" -T 512 -P 7
echo - benson_grave_note.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\benson_grave_note.png" -d ".\gfx\en_new\tmp\benson_grave_note.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\benson_grave_note.png" -p ".\gfx\en_new\tmp\benson_grave_note.pal" -d ".\gfx\en_new\tmp\benson_grave_note.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\benson_grave_note.png" -p ".\gfx\en_new\tmp\benson_grave_note.pal" -t ".\gfx\en_new\tmp\benson_grave_note.gfx" -d ".\gfx\en_new\tmp\benson_grave_note.map" -T 512 -P 7
echo Building English Graphics Files...
".\tools\bass\bass" ".\asm\graphics_en.asm"
echo Done.
pause