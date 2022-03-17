@echo off
echo Converting English Graphics...
echo - camp_moves.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\camp_moves.png" -p ".\gfx\en_new\img\camp_moves.pal" -d ".\gfx\en_new\tmp\camp_moves.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\camp_moves.png" -p ".\gfx\en_new\img\camp_moves.pal" -t ".\gfx\en_new\tmp\camp_moves.gfx" -d ".\gfx\en_new\tmp\camp_moves.map" -T 512 -P 7
echo - camp_tips.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\camp_tips.png" -d ".\gfx\en_new\tmp\camp_tips.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\camp_tips.png" -p ".\gfx\en_new\tmp\camp_tips.pal" -d ".\gfx\en_new\tmp\camp_tips.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\camp_tips.png" -p ".\gfx\en_new\tmp\camp_tips.pal" -t ".\gfx\en_new\tmp\camp_tips.gfx" -d ".\gfx\en_new\tmp\camp_tips.map" -T 512 -P 7
echo - ship_note.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\ship_note.png" -d ".\gfx\en_new\tmp\ship_note.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\ship_note.png" -p ".\gfx\en_new\tmp\ship_note.pal" -d ".\gfx\en_new\tmp\ship_note.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\ship_note.png" -p ".\gfx\en_new\tmp\ship_note.pal" -t ".\gfx\en_new\tmp\ship_note.gfx" -d ".\gfx\en_new\tmp\ship_note.map" -T 512 -P 7
echo - gina_ransom_letter.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\gina_ransom_letter.png" -d ".\gfx\en_new\tmp\gina_ransom_letter.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\gina_ransom_letter.png" -p ".\gfx\en_new\tmp\gina_ransom_letter.pal" -d ".\gfx\en_new\tmp\gina_ransom_letter.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\gina_ransom_letter.png" -p ".\gfx\en_new\tmp\gina_ransom_letter.pal" -t ".\gfx\en_new\tmp\gina_ransom_letter.gfx" -d ".\gfx\en_new\tmp\gina_ransom_letter.map" -T 512 -P 7
echo - antbuster.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\antbuster.png" -d ".\gfx\en_new\tmp\antbuster.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\antbuster.png" -p ".\gfx\en_new\tmp\antbuster.pal" -d ".\gfx\en_new\tmp\antbuster.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\antbuster.png" -p ".\gfx\en_new\tmp\antbuster.pal" -t ".\gfx\en_new\tmp\antbuster.gfx" -d ".\gfx\en_new\tmp\antbuster.map" -T 512 -P 7
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
echo - mgmt_office_sign_bg.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\mgmt_office_sign_bg.png" -d ".\gfx\en_new\tmp\mgmt_office_sign_bg.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\mgmt_office_sign_bg.png" -p ".\gfx\en_new\tmp\mgmt_office_sign_bg.pal" -d ".\gfx\en_new\tmp\mgmt_office_sign_bg.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\mgmt_office_sign_bg.png" -p ".\gfx\en_new\tmp\mgmt_office_sign_bg.pal" -t ".\gfx\en_new\tmp\mgmt_office_sign_bg.gfx" -d ".\gfx\en_new\tmp\mgmt_office_sign_bg.map" -T 512 -P 7
echo - mgmt_office_sign_spr.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\mgmt_office_sign_spr.png" -d ".\gfx\en_new\tmp\mgmt_office_sign_spr.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\mgmt_office_sign_spr.png" -p ".\gfx\en_new\tmp\mgmt_office_sign_spr.pal" -d ".\gfx\en_new\tmp\mgmt_office_sign_spr.gfx" -S -T 12
echo - colonelpermission_bg.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\colonelpermission_bg.png" -d ".\gfx\en_new\tmp\colonelpermission_bg.pal" -S
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\colonelpermission_bg.png" -p ".\gfx\en_new\tmp\colonelpermission_bg.pal" -d ".\gfx\en_new\tmp\colonelpermission_bg.gfx" -T 128
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\colonelpermission_bg.png" -p ".\gfx\en_new\tmp\colonelpermission_bg.pal" -t ".\gfx\en_new\tmp\colonelpermission_bg.gfx" -d ".\gfx\en_new\tmp\colonelpermission_bg.map" -T 512 -P 7
echo - colonelpermission_spr.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\colonelpermission_spr.png" -p ".\gfx\en_new\img\colonelpermission_spr.pal" -d ".\gfx\en_new\tmp\colonelpermission_spr.gfx" -S -D -W 16 -H 16
echo - searchmenu.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\searchmenu.png" -p ".\gfx\en_new\img\searchmenu.pal" -d ".\gfx\en_new\tmp\searchmenu.gfx" -S -T 48 -W 16 -H 16
echo - title.png
".\tools\conv\superfamiconv.exe" -i ".\gfx\en_new\img\title.png" -p ".\gfx\en_new\tmp\title.pal" -t ".\gfx\en_new\tmp\title.gfx" -m ".\gfx\en_new\tmp\title.map" -B 4 -P 7 -T 512
echo - intro.png
".\tools\conv\superfamiconv.exe" palette -i ".\gfx\en_new\img\intro.png" -d ".\gfx\en_new\tmp\intro.pal" -W 16 -H 16
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\intro.png" -p ".\gfx\en_new\tmp\intro.pal" -o ".\gfx\en_new\tmp\intro_4bpp.png" -B 4 -W 16 -H 16
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\tmp\intro_4bpp.png" -p ".\gfx\en_new\tmp\intro.pal" -d ".\gfx\en_new\tmp\intro.gfx" -B 2 -D -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\intro.png" -p ".\gfx\en_new\tmp\intro.pal" -t ".\gfx\en_new\tmp\intro.gfx" -d ".\gfx\en_new\tmp\intro.map" -B 2 -W 16 -H 16 --split-width 32 --split-height 64
echo - credits.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\credits.png" -p ".\gfx\en_new\img\credits.pal" -o ".\gfx\en_new\tmp\credits_4bpp.png" -B 4 -T 128 -W 16 -H 16
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\tmp\credits_4bpp.png" -p ".\gfx\en_new\img\credits.pal" -d ".\gfx\en_new\tmp\credits.gfx" -B 2 -D -T 128 -W 16 -H 16
".\tools\conv\superfamiconv.exe" map -i ".\gfx\en_new\img\credits.png" -p ".\gfx\en_new\img\credits.pal" -t ".\gfx\en_new\tmp\credits.gfx" -d ".\gfx\en_new\tmp\credits.map" -B 2 -P 3 -W 16 -H 16 --split-width 32 --split-height 64
echo - copyright.png
".\tools\conv\superfamiconv.exe" -i ".\gfx\en_new\img\copyright.png" -p ".\gfx\en_new\tmp\copyright.pal" -t ".\gfx\en_new\tmp\copyright.gfx" -S -T 6 -W 16 -H 16
echo - subtitle.png
".\tools\conv\superfamiconv.exe" -i ".\gfx\en_new\img\subtitle.png" -p ".\gfx\en_new\tmp\subtitle.pal" -t ".\gfx\en_new\tmp\subtitle.gfx" -S -T 10 -W 16 -H 16
echo - large_shreek.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\large_shreek.png" -p ".\gfx\en_new\img\large_font.pal" -d ".\gfx\en_new\tmp\large_shreek.gfx" -B 2 -D
echo - large_cutitout.png
".\tools\conv\superfamiconv.exe" tiles -i ".\gfx\en_new\img\large_cutitout.png" -p ".\gfx\en_new\img\large_font.pal" -d ".\gfx\en_new\tmp\large_cutitout.gfx" -B 2 -D
echo Building English Graphics Files...
".\tools\bass\bass" ".\asm\graphics_en.asm"
echo Done.
pause