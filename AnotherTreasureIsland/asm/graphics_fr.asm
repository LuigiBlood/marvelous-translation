//Graphics Generation

macro priority(variable start, variable size) {
	//Set Priority Bit
	variable x = start
	x = x + 1
	variable y = 0
	y = start + size
	while x < y {
		origin x
		db (read(x) | 0x20)
		x = x + 2
	}
}

macro tile(file, bpp, id) {
	evaluate id = {id}
	//print (4<<{bpp})*{id},"\n"
	insert {file},(4<<{bpp})*{id},(4<<{bpp})
}

macro tile16(file, bpp, id) {
	tile({file},{bpp},({id}*2)+0x00)
	tile({file},{bpp},({id}*2)+0x10)
	tile({file},{bpp},({id}*2)+0x01)
	tile({file},{bpp},({id}*2)+0x11)
}

//Font Stuff
output "../gfx/fr/tmp/font_large.bin"
fill 0x1E00,0
origin 0x0000
//Top Left, Bottom Left, Top Right, Bottom Right
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x00)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x01)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x10)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x11)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x20)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x21)

tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x02)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x03)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x12)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x13)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x22)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x23)

tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x04)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x05)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x14)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x15)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x24)
tile16("../gfx/fr/tmp/large_shreek.gfx",2,0x25)
//--------
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x04)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x05)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x00)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x01)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x02)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x03)

tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x10)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x11)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x12)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x13)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x14)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x15)

tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x20)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x21)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x22)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x23)

tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x06)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x07)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x16)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x17)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x26)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x27)

tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x30)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x31)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x32)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x33)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x34)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x35)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x36)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x37)

tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x24)
tile16("../gfx/fr/tmp/large_cutitout.gfx",2,0x25)


//--Intro & Title
//35 - Graphics - Title Logo
output "../gfx/fr/tmp/35.bin", create
fill 0x2000,$00
origin 0x0000; insert "../gfx/fr/tmp/title.gfx"

//38 - Tilemap - Title Logo
output "../gfx/fr/tmp/38.bin", create
fill 0x400,$00
origin 0x0000; insert "../gfx/fr/tmp/title.map"
priority(0, 0x400)

//39,3A,3B - Graphics - Intro Text
output "../gfx/fr/tmp/39.bin", create
fill 0x1000,$00
origin 0x0000; insert "../gfx/fr/tmp/intro.gfx",0x0000,0x1000

output "../gfx/fr/tmp/3A.bin", create
fill 0x1000,$00
origin 0x0000; insert "../gfx/fr/tmp/intro.gfx",0x1000,0x1000

output "../gfx/fr/tmp/3B.bin", create
fill 0x2000,$00
origin 0x0000; insert "../gfx/fr/tmp/intro.gfx",0x2000,0x2000

//3C - Tilemap - Intro
output "../gfx/fr/tmp/3C.bin", create
insert "../gfx/jp/3C.bin"
fill 0x1000,$00
origin 0x0000; insert "../gfx/fr/tmp/intro.map"
origin 0x0C40; insert "../gfx/fr/tmp/intro.map",0x0020,0x03C0
priority(0, 0x1000)

//3D - Palette - Intro
output "../gfx/fr/tmp/3D.bin", create
insert "../gfx/jp/3D.bin"
origin 0x0000; insert "../gfx/fr/tmp/intro.pal"
origin 0x00E0; insert "../gfx/fr/tmp/title.pal"
//New
origin 0x0120; insert "../gfx/fr/tmp/subtitle.pal"
origin 0x0140; fill 0x20,0xFF
origin 0x0160; insert "../gfx/fr/tmp/copyright.pal"

//--Credits
//3E - Graphics - Credits
output "../gfx/fr/tmp/3E.bin", create
insert "../gfx/jp/3E.bin"
origin 0x0000; insert "../gfx/fr/tmp/credits.gfx"

//3F - Tilemap - Credits
output "../gfx/fr/tmp/3F.bin", create
insert "../gfx/jp/3F.bin"
origin 0x0000; insert "../gfx/fr/tmp/credits.map"
origin 0x0C00; //Final Score Tilemap
origin 0x0E80; //Final Screen, THE END Tilemap

//--Search Mode - Tilemaps
//48 - Tilemap - Gina Ransom Letter & Ant Buster
output "../gfx/fr/tmp/48.bin", create
insert "../gfx/jp/48.bin"
origin 0x1800; insert "../gfx/fr/tmp/gina_ransom_letter.map"
origin 0x1C00; insert "../gfx/fr/tmp/antbuster.map"

//4A - Tilemap - Office Sign (BG)
output "../gfx/fr/tmp/4A.bin", create
insert "../gfx/jp/4A.bin"
origin 0x0800; insert "../gfx/fr/tmp/mgmt_office_sign_bg.map",0x0000,0x0400

//4B - Tilemap - Patchies' Note...
output "../gfx/fr/tmp/4B.bin", create
insert "../gfx/jp/4B.bin"
origin 0x1800; insert "../gfx/fr/tmp/patchies_stuck_note.map"

//4D - Tilemap - Camp Tips, Chores List, Benson's Grave, The Monster Poster...
output "../gfx/fr/tmp/4D.bin", create
insert "../gfx/jp/4D.bin"
origin 0x0400; insert "../gfx/fr/tmp/benson_grave_note.map"
origin 0x0800; insert "../gfx/fr/tmp/camp_tips.map"
origin 0x1400; insert "../gfx/fr/tmp/the_monster_bg.map"
origin 0x1C00; insert "../gfx/fr/tmp/chore_list.map",0x0000,0x0400

//4E - Tilemap - Controls, and ???
output "../gfx/fr/tmp/4E.bin", create
insert "../gfx/jp/4E.bin"
origin 0x1000; insert "../gfx/fr/tmp/camp_moves.map"

//50 - Tilemap - Colonel's Permission (BG)
output "../gfx/fr/tmp/50.bin", create
insert "../gfx/jp/50.bin"
origin 0x0400; insert "../gfx/fr/tmp/colonelpermission_bg.map"

//--Search Mode - Graphics
//53 - Graphics - Gina Ransom Letter & Ant Buster
output "../gfx/fr/tmp/53.bin", create
insert "../gfx/jp/53.bin"
origin 0x0000; insert "../gfx/fr/tmp/gina_ransom_letter.gfx"
origin 0x1000; insert "../gfx/fr/tmp/antbuster.gfx"

//56 - Graphics - Office Sign
output "../gfx/fr/tmp/56.bin", create
insert "../gfx/jp/56.bin"
origin 0x1000; insert "../gfx/fr/tmp/mgmt_office_sign_bg.gfx"

//5A - Graphics - Patchies' Note & Island Map
output "../gfx/fr/tmp/5A.bin", create
insert "../gfx/jp/5A.bin"
origin 0x0000; insert "../gfx/fr/tmp/patchies_stuck_note.gfx"

//5F - Graphics - Benson's Grave Note
output "../gfx/fr/tmp/5E.bin", create
insert "../gfx/jp/5E.bin"
origin 0x1000; insert "../gfx/fr/tmp/benson_grave_note.gfx"

//5F - Graphics - Camp Tips & Mouse
output "../gfx/fr/tmp/5F.bin", create
insert "../gfx/jp/5F.bin"
origin 0x0000; insert "../gfx/fr/tmp/camp_tips.gfx"

//60 - Graphics - Gina & The Monster Poster (BG)
output "../gfx/fr/tmp/60.bin", create
insert "../gfx/jp/60.bin"
origin 0x1000; insert "../gfx/fr/tmp/the_monster_bg.gfx"

//62 - Graphics - Chore List & Monkey
output "../gfx/fr/tmp/62.bin", create
insert "../gfx/jp/62.bin"
origin 0x0000; insert "../gfx/fr/tmp/chore_list.gfx"

//63 - Graphics - Camp Moves
output "../gfx/fr/tmp/63.bin", create
insert "../gfx/jp/63.bin"
origin 0x0000; insert "../gfx/fr/tmp/camp_moves.gfx"

//64 - Graphics - Ship Notes
output "../gfx/fr/tmp/64.bin", create
insert "../gfx/jp/64.bin"
origin 0x0000; insert "../gfx/fr/tmp/ship_note_nums.gfx",0x0000,0x1000

//69 - Graphics - Colonel's Permission (BG) & Dungeon Map
output "../gfx/fr/tmp/69.bin", create
insert "../gfx/jp/69.bin"
origin 0x0000; insert "../gfx/fr/tmp/colonelpermission_bg.gfx"

//DA - Graphics - Nintendo Copyright and More
output "../gfx/fr/tmp/DA.bin", create
insert "../gfx/jp/DA.bin"
origin 0x1800; insert "../gfx/fr/tmp/copyright.gfx"

//DB - Graphics - Subtitle
output "../gfx/fr/tmp/DB.bin", create
insert "../gfx/jp/DB.bin"
origin 0x0000; insert "../gfx/fr/tmp/subtitle.gfx"

//E0 - Graphics - Office Sign (Sprite)
output "../gfx/fr/tmp/E0.bin", create
insert "../gfx/jp/E0.bin"
origin 0x1800; insert "../gfx/fr/tmp/mgmt_office_sign_spr.gfx",0x00,0xC0
origin 0x1A00; insert "../gfx/fr/tmp/mgmt_office_sign_spr.gfx",0xC0,0xC0

//F8 - Graphics - Colonel's Permission (SPR)
output "../gfx/fr/tmp/F8.bin", create
insert "../gfx/jp/F8.bin"
origin 0x0800; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x0000,0x40
origin 0x0840; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x0080,0x40
origin 0x0880; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x0100,0x40
origin 0x0980; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x0040,0x40
origin 0x09C0; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x00C0,0x40
origin 0x0A00; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x0200,0x40
origin 0x0A40; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x0280,0x40
origin 0x0A80; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x0300,0x40
origin 0x0B80; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x0240,0x40
origin 0x0BC0; insert "../gfx/fr/tmp/colonelpermission_spr.gfx",0x02C0,0x40
