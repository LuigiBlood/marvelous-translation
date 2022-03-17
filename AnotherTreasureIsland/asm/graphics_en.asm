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

//Font Stuff
output "../gfx/en_new/tmp/font_large.bin"
fill 0x1E00,0
origin 0x0000
//Top Left, Bottom Left, Top Right, Bottom Right
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x00,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x10,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x01,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x11,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x02,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x12,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x03,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x13,0x10

insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x20,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x30,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x21,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x31,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x22,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x32,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x23,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x33,0x10

insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x40,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x50,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x41,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x51,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x42,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x52,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x43,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x53,0x10
//--
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x04,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x14,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x05,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x15,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x06,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x16,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x07,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x17,0x10

insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x24,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x34,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x25,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x35,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x26,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x36,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x27,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x37,0x10

insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x44,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x54,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x45,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x55,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x46,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x56,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x47,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x57,0x10
//--
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x08,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x18,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x09,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x19,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x0A,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x1A,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x0B,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x1B,0x10

insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x28,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x38,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x29,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x39,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x2A,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x3A,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x2B,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x3B,0x10

insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x48,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x58,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x49,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x59,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x4A,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x5A,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x4B,0x10
insert "../gfx/en_new/tmp/large_shreek.gfx",0x10*0x5B,0x10
//--------
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x08,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x18,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x09,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x19,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x0A,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x1A,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x0B,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x1B,0x10

insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x00,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x10,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x01,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x11,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x02,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x12,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x03,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x13,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x04,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x14,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x05,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x15,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x06,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x16,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x07,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x17,0x10

insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x20,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x30,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x21,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x31,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x22,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x32,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x23,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x33,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x24,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x34,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x25,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x35,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x26,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x36,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x27,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x37,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x28,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x38,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x29,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x39,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x2A,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x3A,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x2B,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x3B,0x10

insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x40,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x50,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x41,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x51,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x42,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x52,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x43,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x53,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x44,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x54,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x45,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x55,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x46,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x56,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x47,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x57,0x10

insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x0C,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x1C,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x0D,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x1D,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x0E,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x1E,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x0F,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x1F,0x10

insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x2C,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x3C,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x2D,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x3D,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x2E,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x3E,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x2F,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x3F,0x10

insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x4C,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x5C,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x4D,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x5D,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x4E,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x5E,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x4F,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x5F,0x10

insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x60,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x70,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x61,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x71,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x62,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x72,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x63,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x73,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x64,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x74,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x65,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x75,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x66,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x76,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x67,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x77,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x68,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x78,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x69,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x79,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x6A,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x7A,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x6B,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x7B,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x6C,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x7C,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x6D,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x7D,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x6E,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x7E,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x6F,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x7F,0x10

insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x48,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x58,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x49,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x59,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x4A,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x5A,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x4B,0x10
insert "../gfx/en_new/tmp/large_cutitout.gfx",0x10*0x5B,0x10

//--Intro & Title
//35 - Graphics - Title Logo
output "../gfx/en_new/tmp/35.bin", create
fill 0x2000,$00
origin 0x0000; insert "../gfx/en_new/tmp/title.gfx"

//38 - Tilemap - Title Logo
output "../gfx/en_new/tmp/38.bin", create
fill 0x400,$00
origin 0x0000; insert "../gfx/en_new/tmp/title.map"
priority(0, 0x400)

//39,3A,3B - Graphics - Intro Text
output "../gfx/en_new/tmp/39.bin", create
fill 0x1000,$00
origin 0x0000; insert "../gfx/en_new/tmp/intro.gfx",0x0000,0x1000

output "../gfx/en_new/tmp/3A.bin", create
fill 0x1000,$00
origin 0x0000; insert "../gfx/en_new/tmp/intro.gfx",0x1000,0x1000

output "../gfx/en_new/tmp/3B.bin", create
fill 0x2000,$00
origin 0x0000; insert "../gfx/en_new/tmp/intro.gfx",0x2000,0x2000

//3C - Tilemap - Intro
output "../gfx/en_new/tmp/3C.bin", create
insert "../gfx/jp/3C.bin"
fill 0x1000,$00
origin 0x0000; insert "../gfx/en_new/tmp/intro.map"
origin 0x0C40; insert "../gfx/en_new/tmp/intro.map",0x0020,0x03C0
priority(0, 0x1000)

//3D - Palette - Intro
output "../gfx/en_new/tmp/3D.bin", create
insert "../gfx/jp/3D.bin"
origin 0x0000; insert "../gfx/en_new/tmp/intro.pal"
origin 0x00E0; insert "../gfx/en_new/tmp/title.pal"
//New
origin 0x0120; insert "../gfx/en_new/tmp/subtitle.pal"
origin 0x0140; fill 0x20,0xFF
origin 0x0160; insert "../gfx/en_new/tmp/copyright.pal"

//--Credits
//3E - Graphics - Credits
output "../gfx/en_new/tmp/3E.bin", create
insert "../gfx/jp/3E.bin"
origin 0x0000; insert "../gfx/en_new/tmp/credits.gfx"

//3F - Tilemap - Credits
output "../gfx/en_new/tmp/3F.bin", create
insert "../gfx/jp/3F.bin"
origin 0x0000; insert "../gfx/en_new/tmp/credits.map"

//--Search Mode - Tilemaps
//48 - Tilemap - Gina Ransom Letter & Ant Buster
output "../gfx/en_new/tmp/48.bin", create
insert "../gfx/jp/48.bin"
origin 0x1800; insert "../gfx/en_new/tmp/gina_ransom_letter.map"
origin 0x1C00; insert "../gfx/en_new/tmp/antbuster.map"

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

//50 - Tilemap - Colonel's Permission (BG)
output "../gfx/en_new/tmp/50.bin", create
insert "../gfx/jp/50.bin"
origin 0x0400; insert "../gfx/en_new/tmp/colonelpermission_bg.map"

//--Search Mode - Graphics
//53 - Graphics - Gina Ransom Letter & Ant Buster
output "../gfx/en_new/tmp/53.bin", create
insert "../gfx/jp/53.bin"
origin 0x0000; insert "../gfx/en_new/tmp/gina_ransom_letter.gfx"
origin 0x1000; insert "../gfx/en_new/tmp/antbuster.gfx"

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
origin 0x0000; insert "../gfx/en_new/tmp/ship_note.gfx",0x0000,0x1000

//69 - Graphics - Colonel's Permission (BG) & Dungeon Map
output "../gfx/en_new/tmp/69.bin", create
insert "../gfx/jp/69.bin"
origin 0x0000; insert "../gfx/en_new/tmp/colonelpermission_bg.gfx"

//DA - Graphics - Nintendo Copyright and More
output "../gfx/en_new/tmp/DA.bin", create
insert "../gfx/jp/DA.bin"
origin 0x1800; insert "../gfx/en_new/tmp/copyright.gfx"

//DB - Graphics - Subtitle
output "../gfx/en_new/tmp/DB.bin", create
insert "../gfx/jp/DB.bin"
origin 0x0000; insert "../gfx/en_new/tmp/subtitle.gfx"

//E0 - Graphics - Office Sign (Sprite)
output "../gfx/en_new/tmp/E0.bin", create
insert "../gfx/jp/E0.bin"
origin 0x1800; insert "../gfx/en_new/tmp/mgmt_office_sign_spr.gfx",0x00,0xC0
origin 0x1A00; insert "../gfx/en_new/tmp/mgmt_office_sign_spr.gfx",0xC0,0xC0

//F8 - Graphics - Colonel's Permission (SPR)
output "../gfx/en_new/tmp/F8.bin", create
insert "../gfx/jp/F8.bin"
origin 0x0800; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x0000,0x40
origin 0x0840; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x0080,0x40
origin 0x0880; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x0100,0x40
origin 0x0980; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x0040,0x40
origin 0x09C0; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x00C0,0x40
origin 0x0A00; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x0200,0x40
origin 0x0A40; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x0280,0x40
origin 0x0A80; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x0300,0x40
origin 0x0B80; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x0240,0x40
origin 0x0BC0; insert "../gfx/en_new/tmp/colonelpermission_spr.gfx",0x02C0,0x40
