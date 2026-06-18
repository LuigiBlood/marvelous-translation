@echo off
echo Converting French Graphics...
echo - camp_moves.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\camp_moves.png" -p ".\gfx\fr\img\camp_moves.pal" -d ".\gfx\fr\tmp\camp_moves.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\camp_moves.png" -p ".\gfx\fr\img\camp_moves.pal" -t ".\gfx\fr\tmp\camp_moves.gfx" -d ".\gfx\fr\tmp\camp_moves.map" -T 512 -P 7
echo - camp_tips.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\camp_tips.png" -d ".\gfx\fr\tmp\camp_tips.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\camp_tips.png" -p ".\gfx\fr\tmp\camp_tips.pal" -d ".\gfx\fr\tmp\camp_tips.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\camp_tips.png" -p ".\gfx\fr\tmp\camp_tips.pal" -t ".\gfx\fr\tmp\camp_tips.gfx" -d ".\gfx\fr\tmp\camp_tips.map" -T 512 -P 7
echo - ship_note_num.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\ship_note_nums.png" -d ".\gfx\fr\tmp\ship_note_nums.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\ship_note_nums.png" -p ".\gfx\fr\tmp\ship_note_nums.pal" -d ".\gfx\fr\tmp\ship_note_nums.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\ship_note_nums.png" -p ".\gfx\fr\tmp\ship_note_nums.pal" -t ".\gfx\fr\tmp\ship_note_nums.gfx" -d ".\gfx\fr\tmp\ship_note_nums.map" -T 512 -P 7
echo - ship_note_solve.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\ship_note_solve.png" -p ".\gfx\fr\tmp\ship_note_nums.pal" -d ".\gfx\fr\tmp\ship_note_solve.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\ship_note_solve.png" -p ".\gfx\fr\tmp\ship_note_nums.pal" -t ".\gfx\fr\tmp\ship_note_solve.gfx" -d ".\gfx\fr\tmp\ship_note_solve.map" -T 512 -P 7
echo - gina_ransom_letter.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\gina_ransom_letter.png" -d ".\gfx\fr\tmp\gina_ransom_letter.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\gina_ransom_letter.png" -p ".\gfx\fr\tmp\gina_ransom_letter.pal" -d ".\gfx\fr\tmp\gina_ransom_letter.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\gina_ransom_letter.png" -p ".\gfx\fr\tmp\gina_ransom_letter.pal" -t ".\gfx\fr\tmp\gina_ransom_letter.gfx" -d ".\gfx\fr\tmp\gina_ransom_letter.map" -T 512 -P 7
echo - antbuster.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\antbuster.png" -d ".\gfx\fr\tmp\antbuster.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\antbuster.png" -p ".\gfx\fr\tmp\antbuster.pal" -d ".\gfx\fr\tmp\antbuster.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\antbuster.png" -p ".\gfx\fr\tmp\antbuster.pal" -t ".\gfx\fr\tmp\antbuster.gfx" -d ".\gfx\fr\tmp\antbuster.map" -T 512 -P 7
echo - patchies_stuck_note.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\patchies_stuck_note.png" -d ".\gfx\fr\tmp\patchies_stuck_note.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\patchies_stuck_note.png" -p ".\gfx\fr\tmp\patchies_stuck_note.pal" -d ".\gfx\fr\tmp\patchies_stuck_note.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\patchies_stuck_note.png" -p ".\gfx\fr\tmp\patchies_stuck_note.pal" -t ".\gfx\fr\tmp\patchies_stuck_note.gfx" -d ".\gfx\fr\tmp\patchies_stuck_note.map" -T 512 -P 7
echo - the_monster_bg.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\the_monster_bg.png" -p ".\gfx\fr\img\the_monster_bg.pal" -d ".\gfx\fr\tmp\the_monster_bg.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\the_monster_bg.png" -p ".\gfx\fr\img\the_monster_bg.pal" -t ".\gfx\fr\tmp\the_monster_bg.gfx" -d ".\gfx\fr\tmp\the_monster_bg.map" -T 512 -P 7
echo - chore_list.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\chore_list.png" -d ".\gfx\fr\tmp\chore_list.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\chore_list.png" -p ".\gfx\fr\tmp\chore_list.pal" -d ".\gfx\fr\tmp\chore_list.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\chore_list.png" -p ".\gfx\fr\tmp\chore_list.pal" -t ".\gfx\fr\tmp\chore_list.gfx" -d ".\gfx\fr\tmp\chore_list.map" -T 512 -P 7
echo - benson_grave_note.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\benson_grave_note.png" -d ".\gfx\fr\tmp\benson_grave_note.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\benson_grave_note.png" -p ".\gfx\fr\tmp\benson_grave_note.pal" -d ".\gfx\fr\tmp\benson_grave_note.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\benson_grave_note.png" -p ".\gfx\fr\tmp\benson_grave_note.pal" -t ".\gfx\fr\tmp\benson_grave_note.gfx" -d ".\gfx\fr\tmp\benson_grave_note.map" -T 512 -P 7
echo - mgmt_office_sign_bg.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\mgmt_office_sign_bg.png" -d ".\gfx\fr\tmp\mgmt_office_sign_bg.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\mgmt_office_sign_bg.png" -p ".\gfx\fr\tmp\mgmt_office_sign_bg.pal" -d ".\gfx\fr\tmp\mgmt_office_sign_bg.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\mgmt_office_sign_bg.png" -p ".\gfx\fr\tmp\mgmt_office_sign_bg.pal" -t ".\gfx\fr\tmp\mgmt_office_sign_bg.gfx" -d ".\gfx\fr\tmp\mgmt_office_sign_bg.map" -T 512 -P 7
echo - mgmt_office_sign_spr.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\mgmt_office_sign_spr.png" -d ".\gfx\fr\tmp\mgmt_office_sign_spr.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\mgmt_office_sign_spr.png" -p ".\gfx\fr\tmp\mgmt_office_sign_spr.pal" -d ".\gfx\fr\tmp\mgmt_office_sign_spr.gfx" -S -T 12
echo - colonelpermission_bg.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\colonelpermission_bg.png" -d ".\gfx\fr\tmp\colonelpermission_bg.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\colonelpermission_bg.png" -p ".\gfx\fr\tmp\colonelpermission_bg.pal" -d ".\gfx\fr\tmp\colonelpermission_bg.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\colonelpermission_bg.png" -p ".\gfx\fr\tmp\colonelpermission_bg.pal" -t ".\gfx\fr\tmp\colonelpermission_bg.gfx" -d ".\gfx\fr\tmp\colonelpermission_bg.map" -T 512 -P 7
echo - colonelpermission_spr.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\colonelpermission_spr.png" -p ".\gfx\fr\img\colonelpermission_spr.pal" -d ".\gfx\fr\tmp\colonelpermission_spr.gfx" -S -D -W 16 -H 16
echo - searchmenu.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\searchmenu.png" -p ".\gfx\fr\img\searchmenu.pal" -d ".\gfx\fr\tmp\searchmenu.gfx" -S -T 48 -W 16 -H 16
echo - title.png
".\tools\conv\superfamiconv.exe" -i ".\gfx\fr\img\title.png" -p ".\gfx\fr\tmp\title.pal" -t ".\gfx\fr\tmp\title.gfx" -m ".\gfx\fr\tmp\title.map" -B 4 -P 7 -T 512
echo - intro.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\fr\img\intro.png" -d ".\gfx\fr\tmp\intro.pal" -W 16 -H 16
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\intro.png" -p ".\gfx\fr\tmp\intro.pal" -o ".\gfx\fr\tmp\intro_4bpp.png" -B 4 -W 16 -H 16
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\tmp\intro_4bpp.png" -p ".\gfx\fr\tmp\intro.pal" -d ".\gfx\fr\tmp\intro.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\intro.png" -p ".\gfx\fr\tmp\intro.pal" -t ".\gfx\fr\tmp\intro.gfx" -d ".\gfx\fr\tmp\intro.map" -B 2 -W 16 -H 16 --split-width 32 --split-height 64
echo - copyright.png
".\tools\conv\superfamiconv.exe" -i ".\gfx\fr\img\copyright.png" -p ".\gfx\fr\tmp\copyright.pal" -t ".\gfx\fr\tmp\copyright.gfx" -S -T 6 -W 16 -H 16
echo - subtitle.png
".\tools\conv\superfamiconv.exe" -i ".\gfx\fr\img\subtitle.png" -p ".\gfx\fr\tmp\subtitle.pal" -t ".\gfx\fr\tmp\subtitle.gfx" -S -T 10 -W 16 -H 16
echo - large_shreek.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\large_shreek.png" -p ".\gfx\fr\img\large_font.pal" -d ".\gfx\fr\tmp\large_shreek.gfx" -B 2 -D
echo - large_cutitout.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\large_cutitout.png" -p ".\gfx\fr\img\large_font.pal" -d ".\gfx\fr\tmp\large_cutitout.gfx" -B 2 -D
echo - title_search.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\title_search.png" -p ".\gfx\fr\img\title_search.pal" -d ".\gfx\fr\tmp\title_search.gfx" -B 2 -D -W 16 -H 16
echo - credits_01.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_01.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_01.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_01.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_01.gfx" -d ".\gfx\fr\tmp\credits_01.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_02.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_02.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_02.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_02.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_02.gfx" -d ".\gfx\fr\tmp\credits_02.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_03.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_03.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_03.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_03.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_03.gfx" -d ".\gfx\fr\tmp\credits_03.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_04.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_04.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_04.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_04.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_04.gfx" -d ".\gfx\fr\tmp\credits_04.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_05.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_05.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_05.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_05.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_05.gfx" -d ".\gfx\fr\tmp\credits_05.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_06.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_06.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_06.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_06.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_06.gfx" -d ".\gfx\fr\tmp\credits_06.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_07.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_07.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_07.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_07.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_07.gfx" -d ".\gfx\fr\tmp\credits_07.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_08.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_08.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_08.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_08.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_08.gfx" -d ".\gfx\fr\tmp\credits_08.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_09.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_09.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_09.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_09.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_09.gfx" -d ".\gfx\fr\tmp\credits_09.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_10.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_10.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_10.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_10.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_10.gfx" -d ".\gfx\fr\tmp\credits_10.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_11.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_11.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_11.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_11.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_11.gfx" -d ".\gfx\fr\tmp\credits_11.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_12.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_12.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_12.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_12.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_12.gfx" -d ".\gfx\fr\tmp\credits_12.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_translation_01.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_translation_01.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_translation_01.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_translation_01.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_translation_01.gfx" -d ".\gfx\fr\tmp\credits_translation_01.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits_translation_02.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\fr\img\staff\credits_translation_02.png" -p ".\gfx\fr\img\credits.pal" -d ".\gfx\fr\tmp\credits_translation_02.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\fr\img\staff\credits_translation_02.png" -p ".\gfx\fr\img\credits.pal" -t ".\gfx\fr\tmp\credits_translation_02.gfx" -d ".\gfx\fr\tmp\credits_translation_02.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo Building French Graphics Files...
".\tools\bass\bass" ".\asm\graphics_fr.asm"
echo Done.
pause