//Graphics Generation

//--Intro
//39,3A,3B - Graphics - Intro Text
output "../gfx/en_new/tmp/39.bin", create
fill 0x1000,$00
origin 0x0000; insert "../gfx/en_new/img/intro.gfx",0x0000,0x1000

output "../gfx/en_new/tmp/3A.bin", create
fill 0x1000,$00
origin 0x0000; insert "../gfx/en_new/img/intro.gfx",0x1000,0x1000

output "../gfx/en_new/tmp/3B.bin", create
fill 0x2000,$00
origin 0x0000; insert "../gfx/en_new/img/intro.gfx",0x2000,0x2000

//3D - Palette - Intro
output "../gfx/en_new/tmp/3D.bin", create
insert "../gfx/jp/3D.bin"
origin 0x0000; insert "../gfx/en_new/img/intro.pal"

//--Search Mode - Tilemaps
//48 - Tilemap - Gina Ransom Letter...
output "../gfx/en_new/tmp/48.bin", create
insert "../gfx/jp/48.bin"
origin 0x1800; insert "../gfx/en_new/tmp/gina_ransom_letter.map"

//4A - Tilemap - Office Sign (BG)
output "../gfx/en_new/tmp/4A.bin", create
insert "../gfx/jp/4A.bin"
origin 0x0800; insert "../gfx/en_new/tmp/mgmt_office_sign_bg.map",0x0000,0x0400

//4B - Tilemap - Patchies' Note...
output "../gfx/en_new/tmp/4B.bin", create
insert "../gfx/jp/4B.bin"
origin 0x1800; insert "../gfx/en_new/tmp/patchies_stuck_note.map"

//4D - Tilemap - Camp Tips, Chores List, Benson's Grave, The Monster Poster...
output "../gfx/en_new/tmp/4D.bin", create
insert "../gfx/jp/4D.bin"
origin 0x0400; insert "../gfx/en_new/tmp/benson_grave_note.map"
origin 0x0800; insert "../gfx/en_new/tmp/camp_tips.map"
origin 0x1400; insert "../gfx/en_new/tmp/the_monster_bg.map"
origin 0x1C00; insert "../gfx/en_new/tmp/chore_list.map",0x0000,0x0400

//4E - Tilemap - Controls, and ???
output "../gfx/en_new/tmp/4E.bin", create
insert "../gfx/jp/4E.bin"
origin 0x1000; insert "../gfx/en_new/tmp/camp_moves.map"

//--Search Mode - Graphics
//53 - Graphics - Gina Ransom Letter & Ant Buster
output "../gfx/en_new/tmp/53.bin", create
//insert "../gfx/jp/53.bin"
insert "../gfx/en/lz_gina_ransom_gfx.bin"
origin 0x0000; insert "../gfx/en_new/tmp/gina_ransom_letter.gfx"

//56 - Graphics - Office Sign
output "../gfx/en_new/tmp/56.bin", create
insert "../gfx/jp/56.bin"
origin 0x1000; insert "../gfx/en_new/tmp/mgmt_office_sign_bg.gfx"

//5A - Graphics - Patchies' Note & Island Map
output "../gfx/en_new/tmp/5A.bin", create
insert "../gfx/jp/5A.bin"
origin 0x0000; insert "../gfx/en_new/tmp/patchies_stuck_note.gfx"

//5F - Graphics - Benson's Grave Note
output "../gfx/en_new/tmp/5E.bin", create
insert "../gfx/jp/5E.bin"
origin 0x1000; insert "../gfx/en_new/tmp/benson_grave_note.gfx"

//5F - Graphics - Camp Tips & Mouse
output "../gfx/en_new/tmp/5F.bin", create
insert "../gfx/jp/5F.bin"
origin 0x0000; insert "../gfx/en_new/tmp/camp_tips.gfx"

//60 - Graphics - Gina & The Monster Poster (BG)
output "../gfx/en_new/tmp/60.bin", create
insert "../gfx/jp/60.bin"
origin 0x1000; insert "../gfx/en_new/tmp/the_monster_bg.gfx"

//62 - Graphics - Chore List & Monkey
output "../gfx/en_new/tmp/62.bin", create
insert "../gfx/jp/62.bin"
origin 0x0000; insert "../gfx/en_new/tmp/chore_list.gfx"

//63 - Graphics - Camp Moves
output "../gfx/en_new/tmp/63.bin", create
insert "../gfx/jp/63.bin"
origin 0x0000; insert "../gfx/en_new/tmp/camp_moves.gfx"

//64 - Graphics - Ship Notes
output "../gfx/en_new/tmp/64.bin", create
insert "../gfx/jp/64.bin"
origin 0x0000; insert "../gfx/en_new/tmp/ship_note_tiles.gfx"

//E0 - Graphics - Office Sign (Sprite)
output "../gfx/en_new/tmp/E0.bin", create
insert "../gfx/jp/E0.bin"
origin 0x1800; insert "../gfx/en_new/tmp/mgmt_office_sign_spr.gfx",0x00,0xC0
origin 0x1A00; insert "../gfx/en_new/tmp/mgmt_office_sign_spr.gfx",0xC0,0xC0
