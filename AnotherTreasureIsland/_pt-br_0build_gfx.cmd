@echo off
echo Converting Brazilian Portuguese Graphics...
echo - camp_moves.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\camp_moves.png" -p ".\gfx\pt-br\img\camp_moves.pal" -d ".\gfx\pt-br\tmp\camp_moves.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\camp_moves.png" -p ".\gfx\pt-br\img\camp_moves.pal" -t ".\gfx\pt-br\tmp\camp_moves.gfx" -d ".\gfx\pt-br\tmp\camp_moves.map" -T 512 -P 7
echo - camp_tips.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\camp_tips.png" -d ".\gfx\pt-br\tmp\camp_tips.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\camp_tips.png" -p ".\gfx\pt-br\tmp\camp_tips.pal" -d ".\gfx\pt-br\tmp\camp_tips.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\camp_tips.png" -p ".\gfx\pt-br\tmp\camp_tips.pal" -t ".\gfx\pt-br\tmp\camp_tips.gfx" -d ".\gfx\pt-br\tmp\camp_tips.map" -T 512 -P 7
echo - ship_note_num.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\ship_note_nums.png" -d ".\gfx\pt-br\tmp\ship_note_nums.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\ship_note_nums.png" -p ".\gfx\pt-br\tmp\ship_note_nums.pal" -d ".\gfx\pt-br\tmp\ship_note_nums.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\ship_note_nums.png" -p ".\gfx\pt-br\tmp\ship_note_nums.pal" -t ".\gfx\pt-br\tmp\ship_note_nums.gfx" -d ".\gfx\pt-br\tmp\ship_note_nums.map" -T 512 -P 7
echo - ship_note_solve.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\ship_note_solve.png" -p ".\gfx\pt-br\tmp\ship_note_nums.pal" -d ".\gfx\pt-br\tmp\ship_note_solve.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\ship_note_solve.png" -p ".\gfx\pt-br\tmp\ship_note_nums.pal" -t ".\gfx\pt-br\tmp\ship_note_solve.gfx" -d ".\gfx\pt-br\tmp\ship_note_solve.map" -T 512 -P 7
echo - gina_ransom_letter.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\gina_ransom_letter.png" -d ".\gfx\pt-br\tmp\gina_ransom_letter.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\gina_ransom_letter.png" -p ".\gfx\pt-br\tmp\gina_ransom_letter.pal" -d ".\gfx\pt-br\tmp\gina_ransom_letter.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\gina_ransom_letter.png" -p ".\gfx\pt-br\tmp\gina_ransom_letter.pal" -t ".\gfx\pt-br\tmp\gina_ransom_letter.gfx" -d ".\gfx\pt-br\tmp\gina_ransom_letter.map" -T 512 -P 7
echo - antbuster.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\antbuster.png" -d ".\gfx\pt-br\tmp\antbuster.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\antbuster.png" -p ".\gfx\pt-br\tmp\antbuster.pal" -d ".\gfx\pt-br\tmp\antbuster.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\antbuster.png" -p ".\gfx\pt-br\tmp\antbuster.pal" -t ".\gfx\pt-br\tmp\antbuster.gfx" -d ".\gfx\pt-br\tmp\antbuster.map" -T 512 -P 7
echo - patchies_stuck_note.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\patchies_stuck_note.png" -d ".\gfx\pt-br\tmp\patchies_stuck_note.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\patchies_stuck_note.png" -p ".\gfx\pt-br\tmp\patchies_stuck_note.pal" -d ".\gfx\pt-br\tmp\patchies_stuck_note.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\patchies_stuck_note.png" -p ".\gfx\pt-br\tmp\patchies_stuck_note.pal" -t ".\gfx\pt-br\tmp\patchies_stuck_note.gfx" -d ".\gfx\pt-br\tmp\patchies_stuck_note.map" -T 512 -P 7
echo - the_monster_bg.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\the_monster_bg.png" -p ".\gfx\pt-br\img\the_monster_bg.pal" -d ".\gfx\pt-br\tmp\the_monster_bg.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\the_monster_bg.png" -p ".\gfx\pt-br\img\the_monster_bg.pal" -t ".\gfx\pt-br\tmp\the_monster_bg.gfx" -d ".\gfx\pt-br\tmp\the_monster_bg.map" -T 512 -P 7
echo - chore_list.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\chore_list.png" -d ".\gfx\pt-br\tmp\chore_list.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\chore_list.png" -p ".\gfx\pt-br\tmp\chore_list.pal" -d ".\gfx\pt-br\tmp\chore_list.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\chore_list.png" -p ".\gfx\pt-br\tmp\chore_list.pal" -t ".\gfx\pt-br\tmp\chore_list.gfx" -d ".\gfx\pt-br\tmp\chore_list.map" -T 512 -P 7
echo - benson_grave_note.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\benson_grave_note.png" -d ".\gfx\pt-br\tmp\benson_grave_note.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\benson_grave_note.png" -p ".\gfx\pt-br\tmp\benson_grave_note.pal" -d ".\gfx\pt-br\tmp\benson_grave_note.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\benson_grave_note.png" -p ".\gfx\pt-br\tmp\benson_grave_note.pal" -t ".\gfx\pt-br\tmp\benson_grave_note.gfx" -d ".\gfx\pt-br\tmp\benson_grave_note.map" -T 512 -P 7
echo - mgmt_office_sign_bg.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\mgmt_office_sign_bg.png" -d ".\gfx\pt-br\tmp\mgmt_office_sign_bg.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\mgmt_office_sign_bg.png" -p ".\gfx\pt-br\tmp\mgmt_office_sign_bg.pal" -d ".\gfx\pt-br\tmp\mgmt_office_sign_bg.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\mgmt_office_sign_bg.png" -p ".\gfx\pt-br\tmp\mgmt_office_sign_bg.pal" -t ".\gfx\pt-br\tmp\mgmt_office_sign_bg.gfx" -d ".\gfx\pt-br\tmp\mgmt_office_sign_bg.map" -T 512 -P 7
echo - mgmt_office_sign_spr.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\mgmt_office_sign_spr.png" -d ".\gfx\pt-br\tmp\mgmt_office_sign_spr.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\mgmt_office_sign_spr.png" -p ".\gfx\pt-br\tmp\mgmt_office_sign_spr.pal" -d ".\gfx\pt-br\tmp\mgmt_office_sign_spr.gfx" -S -T 12
echo - colonelpermission_bg.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\colonelpermission_bg.png" -d ".\gfx\pt-br\tmp\colonelpermission_bg.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\colonelpermission_bg.png" -p ".\gfx\pt-br\tmp\colonelpermission_bg.pal" -d ".\gfx\pt-br\tmp\colonelpermission_bg.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\colonelpermission_bg.png" -p ".\gfx\pt-br\tmp\colonelpermission_bg.pal" -t ".\gfx\pt-br\tmp\colonelpermission_bg.gfx" -d ".\gfx\pt-br\tmp\colonelpermission_bg.map" -T 512 -P 7
echo - colonelpermission_spr.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\colonelpermission_spr.png" -p ".\gfx\pt-br\img\colonelpermission_spr.pal" -d ".\gfx\pt-br\tmp\colonelpermission_spr.gfx" -S -D -W 16 -H 16
echo - searchmenu.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\searchmenu.png" -p ".\gfx\pt-br\img\searchmenu.pal" -d ".\gfx\pt-br\tmp\searchmenu.gfx" -S -T 48 -W 16 -H 16
echo - title.png
".\tools\conv\superfamiconv.exe" -i ".\gfx\pt-br\img\title.png" -p ".\gfx\pt-br\tmp\title.pal" -t ".\gfx\pt-br\tmp\title.gfx" -m ".\gfx\pt-br\tmp\title.map" -B 4 -P 7 -T 512
echo - intro.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\pt-br\img\intro.png" -d ".\gfx\pt-br\tmp\intro.pal" -W 16 -H 16
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\intro.png" -p ".\gfx\pt-br\tmp\intro.pal" -o ".\gfx\pt-br\tmp\intro_4bpp.png" -B 4 -W 16 -H 16
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\tmp\intro_4bpp.png" -p ".\gfx\pt-br\tmp\intro.pal" -d ".\gfx\pt-br\tmp\intro.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\intro.png" -p ".\gfx\pt-br\tmp\intro.pal" -t ".\gfx\pt-br\tmp\intro.gfx" -d ".\gfx\pt-br\tmp\intro.map" -B 2 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\credits.png" -p ".\gfx\pt-br\img\credits.pal" -o ".\gfx\pt-br\tmp\credits_4bpp.png" -B 4 -T 128 -W 16 -H 16
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\tmp\credits_4bpp.png" -p ".\gfx\pt-br\img\credits.pal" -d ".\gfx\pt-br\tmp\credits.gfx" -B 2 -D -T 128 -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\pt-br\img\credits.png" -p ".\gfx\pt-br\img\credits.pal" -t ".\gfx\pt-br\tmp\credits.gfx" -d ".\gfx\pt-br\tmp\credits.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - copyright.png
".\tools\conv\superfamiconv.exe" -i ".\gfx\pt-br\img\copyright.png" -p ".\gfx\pt-br\tmp\copyright.pal" -t ".\gfx\pt-br\tmp\copyright.gfx" -S -T 6 -W 16 -H 16
echo - subtitle.png
".\tools\conv\superfamiconv.exe" -i ".\gfx\pt-br\img\subtitle.png" -p ".\gfx\pt-br\tmp\subtitle.pal" -t ".\gfx\pt-br\tmp\subtitle.gfx" -S -T 10 -W 16 -H 16
echo - large_shreek.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\large_shreek.png" -p ".\gfx\pt-br\img\large_font.pal" -d ".\gfx\pt-br\tmp\large_shreek.gfx" -B 2 -D
echo - large_cutitout.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\large_cutitout.png" -p ".\gfx\pt-br\img\large_font.pal" -d ".\gfx\pt-br\tmp\large_cutitout.gfx" -B 2 -D
echo - title_search.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\pt-br\img\title_search.png" -p ".\gfx\pt-br\img\title_search.pal" -d ".\gfx\pt-br\tmp\title_search.gfx" -B 2 -D -W 16 -H 16
echo Building Brazilian Portuguese Graphics Files...
".\tools\bass\bass" ".\asm\graphics_pt-br.asm"
echo Done.
IF "%~1" == "" (timeout /t 10)
