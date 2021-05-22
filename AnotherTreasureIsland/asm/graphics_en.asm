//Graphics Generation

//--Search Mode - Tilemaps
//48 - Tilemap - Gina Ransom Letter...
output "../gfx/en_new/tmp/48.bin", create
insert "../gfx/jp/48.bin"
origin 0x1800; insert "../gfx/en_new/tmp/gina_ransom_letter.map"

//4B - Tilemap - Patchies' Note...
output "../gfx/en_new/tmp/4B.bin", create
insert "../gfx/jp/4B.bin"
origin 0x1800; insert "../gfx/en_new/tmp/patchies_stuck_note.map"

//4D - Tilemap - Camp Tips, Chores List, Benson's Grave...
output "../gfx/en_new/tmp/4D.bin", create
//insert "../gfx/jp/4D.bin"
insert "../gfx/en/lz_chorelistmisc_map.bin"
origin 0x0800; insert "../gfx/en_new/tmp/camp_tips.map"

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

//5A - Graphics - Patchies' Note & Island Map
output "../gfx/en_new/tmp/5A.bin", create
origin 0x0000; insert "../gfx/en_new/tmp/patchies_stuck_note.gfx"

//5F - Graphics - Camp Tips & Mouse
output "../gfx/en_new/tmp/5F.bin", create
insert "../gfx/jp/5F.bin"
origin 0x0000; insert "../gfx/en_new/tmp/camp_tips.gfx"

//63 - Graphics - Camp Moves
output "../gfx/en_new/tmp/63.bin", create
insert "../gfx/jp/63.bin"
origin 0x0000; insert "../gfx/en_new/tmp/camp_moves.gfx"

//64 - Graphics - Ship Notes
output "../gfx/en_new/tmp/64.bin", create
insert "../gfx/jp/64.bin"
origin 0x0000; insert "../gfx/en_new/tmp/ship_note_tiles.gfx"