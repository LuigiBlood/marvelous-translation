//Insert Data

//Clean Japanese Script
seekFile($21B400)
fill 0x20B9D,$FF

//Graphics

//-Font
seekFile($2AC000)
	insert "../text/fr/font.bin"
seekFile($270000)
	insert "../text/fr/kanji.bin"

//--Title Sprite OAM Data
seekAddr($9FFF25)
	//--Copyright
	db $50,$C0,$80,$26
	db $60,$C0,$82,$26
	db $70,$C0,$84,$26
	db $80,$C0,$86,$26
	db $90,$C0,$88,$26
	db $A0,$C0,$8A,$26

	//--Subtitle
	db $2F,$68,$C0,$22
	db $3F,$68,$C2,$22
	db $4F,$68,$C4,$22
	db $5F,$68,$C6,$22
	db $6F,$68,$C8,$22
	db $7F,$68,$CA,$22
	db $8F,$68,$CC,$22
	db $9F,$68,$CE,$22
	db $AF,$68,$E0,$22
	db $BF,$68,$E2,$22
	db $AF,$78,$E4,$22

//-Menu

//--Search Menu Icons
seekFile($2B6000)
	insert "../gfx/fr/tmp/searchmenu.gfx"

//--Misc HUD
seekFile($268000)
	insert "../text/fr/icons.bin"	//TransPutt Integration
seekFile($26A400)	//Marvelous - Search Mode Logo
	insert "../gfx/fr/tmp/title_search.gfx"

//--Journal Menu Tilemap Hacks
seekFile($2C0A2B)	//SELECTでゲーム画面た & Move & Select Text Hack
map_journal1:
	insert "../gfx/fr/journal1_map.bin"
seekFile($2C1189)	//"Save"
map_journal2:
	insert "../gfx/fr/journal2_map.bin"
seekFile($2C18C8)	//#に記録していいですか？
					//"Wanna save to entry #?"
map_journal3:
	insert "../gfx/fr/journal3_map.bin"
seekAddr($9899B8)	//Change place to entry number
	adc.w #$30A0
	sta $7F00B2
seekAddr($989E1B)	//Change place to entry number (Save & Exit)
	adc.w #$30A0
	sta $7F00B2
seekFile($2C1AAF)	//#に記録しました。
					//Journal entry # has been saved.
map_journal4:
	insert "../gfx/fr/journal4_map.bin"
seekAddr($989B1B)	//Change place to entry number
	adc.w #$30A0
	sta $7F00AC-8
seekAddr($989F0F)	//Change place to entry number (Save & Exit, see code.asm)
	adc.w #$30A0
	sta $7F00AC-8

seekFile($2C18EA)
map_journal_yesno:
	dw $30C0,$30C2,$308E,$2160,$30C4,$30C6,$30C8,$2160,$2160,$2160
seekAddr($9899E0)	//Selection Sprites
	db $79,$88,$98,$A8


//--Large Messages
//Monkey Screech, "HEY!", "That's Enough / Cut it OUT!"
seekFile($2CE000)
	insert "../gfx/fr/tmp/font_large.bin"

//Leader Names
seekFile($2FC8D7)
	dw $03, $30, $36, $35	//Dion
	dw $0C, $28, $3F, $EF	//Max
	dw $09, $28, $2A, $32	//Jack

//Turning Cross Puzzle
seekAddr($9FCCA4)
	lda.w #$000E		// O
seekAddr($9FCCAA)
	lda.w #$000A		// K
seekAddr($9FCCB0)
	lda.w #$0046		// ?
seekAddr($9FCC4E)
	lda.w #$0048		// /

//Watering Robot Path
seekAddr($9FCB40)
	lda.w #$000E		// O
seekAddr($9FCB46)
	lda.w #$000A		// K
seekAddr($9FCB4C)
	lda.w #$0046		// ?

//Buster Cannon Charge
seekAddr($9FD32A)
	lda.w #$000E		// O
seekAddr($9FD330)
	lda.w #$000A		// K

//003182 - Luck Rock Amount (can be up to 9999)
//Fix Luck Rock Amount
//(Set up {0} in the item names; it will automatically be replaced, no spaces needed)
seekAddr($9FBFFC)
	cmp.w #$5C02
seekAddr($9FC069)	//X000 Digit
	adc.b #$2E
seekAddr($9FC077)
	lda.b #$02
seekAddr($9FC0AF)	//0X00 Digit
	adc.b #$2E
seekAddr($9FC0BD)
	lda.b #$02
seekAddr($9FC0F5)	//00X0 Digit
	adc.b #$2E
seekAddr($9FC103)
	lda.b #$02
seekAddr($9FC11C)	//000X Digit
	adc.b #$2E
seekAddr($9FC12A)
	lda.b #$02

//Chapter Screen ($8DF169)
seekAddr($8DF169)
	ldx.b #0
	lda.w #$30C2
-;	sta $7F011C,x
	inc; inc
	inx; inx
	cpx.b #8
	bcc -
	lda $3100
	clc
	adc.w #$3004
	sta $7F0124

	jsl asm_set_chapter_tilemap
	//nop; nop; nop; nop
	nop; nop; nop; nop; nop; nop
	nop

//Expand File 0x3B to 0x2000 bytes
seekAddr($148122)
	ldy.w #$2000

//Luck Rock Cannon Amount ($9FD7A6)
//B Button Palette
seekAddr($9FD84F)
	sta $40AE2B+4
	sta $40AE2D+4
//Remove Kanji
seekAddr($9FD7AE)
	lda.w #$0254
seekAddr($9FD7D7)
	lda.w #$0255
//Position
seekAddr($9FD73A)
	//ldx.w #$00E2

//Game Over Save & Quit Text VRAM Upload
seekAddr($149886)
	lda.w #$6700
seekAddr($149897)
	lda.w #$1000


//Palette Changes
seekFile($2CAF40)
pal_ch1_patchiesnote:
	insert "../gfx/fr/tmp/patchies_stuck_note.pal"
seekFile($2CAFA0)
pal_ch1_ginaransomletter:
	insert "../gfx/fr/tmp/gina_ransom_letter.pal"
seekFile($2CAFE0)
pal_ch1_camptips:
	insert "../gfx/fr/tmp/camp_tips.pal"
seekFile($2CB100)
pal_ch1_shipnote:
	insert "../gfx/fr/tmp/ship_note_nums.pal"
seekFile($2CB5E0)
pal_ch2_chorelist:
	insert "../gfx/fr/tmp/chore_list.pal"
seekFile($2C8820)
pal_ch2_bensongrave:
	insert "../gfx/fr/tmp/benson_grave_note.pal"
seekFile($2C8B60)
pal_ch3_mgmtofficesign_bg:
	insert "../gfx/fr/tmp/mgmt_office_sign_bg.pal"
seekFile($2C9EE0)
pal_ch3_mgmtofficesign_spr:
	insert "../gfx/fr/tmp/mgmt_office_sign_spr.pal"
seekFile($2CC380)
pal_ch4_antbuster:
	insert "../gfx/fr/tmp/antbuster.pal"
seekFile($2CC620)
pal_ch5_colonel_note_bg:
	insert "../gfx/fr/tmp/colonelpermission_bg.pal"

//Free Space (1)
seekFile($21B400)
free_space1:

map_teamname:			//18 - $0E286B
	insert "../gfx/fr/lz/lz_teamname_map.bin.lz"

gfx_title:				//35 - $121964
	insert "../gfx/fr/lz/35.bin.lz"

map_title:				//38 - $123726
	insert "../gfx/fr/lz/38.bin.lz"
gfx_intro1:				//39 - $123951
	insert "../gfx/fr/lz/39.bin.lz"
gfx_intro2:				//3A - $1246DE
	insert "../gfx/fr/lz/3A.bin.lz"
gfx_intro3:				//3B - $12550E
	insert "../gfx/fr/lz/3B.bin.lz"
map_intro:				//3C - $1257F6
	insert "../gfx/fr/lz/3C.bin.lz"
pal_intro:				//3D - $125ADD
	insert "../gfx/fr/lz/3D.bin.lz"
gfx_credits:			//3E - $125BB6
	insert "../gfx/fr/lz/3E.bin.lz"
map_credits:			//3F - $12735C
	insert "../gfx/fr/lz/3F.bin.lz"

//Search Mode - Tilemaps (48 to 50)
map_ch1_gina_ransom:	//48 - $12A9D0
	insert "../gfx/fr/lz/48.bin.lz"

map_ch3_sign:			//4A - $12BDA4
	insert "../gfx/fr/lz/4A.bin.lz"
map_ch1_patchiesnote:	//4B - $12C7C8
	insert "../gfx/fr/lz/4B.bin.lz"

map_ch1_misc:			//4D - $12DEB0
	insert "../gfx/fr/lz/4D.bin.lz"
map_ch1_misc2:			//4E - $12E9BA
	insert "../gfx/fr/lz/4E.bin.lz"

map_ch5_colonel_note:	//50
	insert "../gfx/fr/lz/50.bin.lz"

//Search Mode - Graphics (51 to ??)
gfx_ch1_gina_ransom:	//53 - $132FC4
	insert "../gfx/fr/lz/53.bin.lz"

gfx_ch3_sign:			//56 - $136BFE
	insert "../gfx/fr/lz/56.bin.lz"

gfx_ch1_patches_stuck:	//5A - $13C578
	insert "../gfx/fr/lz/5A.bin.lz"

gfx_ch2_bensongrave:	//5E - $142CE4
	insert "../gfx/fr/lz/5E.bin.lz"
gfx_ch1_camptips:		//5F - $1447AE
	insert "../gfx/fr/lz/5F.bin.lz"
gfx_ch2_monster:		//60 - $145F3B
	insert "../gfx/fr/lz/60.bin.lz"

gfx_ch2_chorelist:		//62 - $1490F9
	insert "../gfx/fr/lz/62.bin.lz"
gfx_ch1_controls:		//63 - $14A478
	insert "../gfx/fr/lz/63.bin.lz"
gfx_ch1_ship_notes:		//64 - $14B628
	insert "../gfx/fr/lz/64.bin.lz"

gfx_ch5_colonel_note2:	//69 - $151D31
	insert "../gfx/fr/lz/69.bin.lz"

//Sprites (B9 to F8)
gfx_kick_smash_minigame://D9 - $1D860C
    insert "../gfx/fr/lz/D9.bin.lz"
gfx_title_nintendo:		//DA - $1D948F
	insert "../gfx/fr/lz/DA.bin.lz"
gfx_title_sub:			//DB - $1DA5ED
	insert "../gfx/fr/lz/DB.bin.lz"

gfx_mgmt_office_spr:	//E0
	insert "../gfx/fr/lz/E0.bin.lz"

gfx_ch5_colonel_note1:	//F8 - $1FE99C
	insert "../gfx/fr/lz/F8.bin.lz"

//Chore List Checks Tables
tbl_chore_list_maps:
	dw tbl_chore_list_map00, tbl_chore_list_map01, tbl_chore_list_map02, tbl_chore_list_map01, tbl_chore_list_map04

tbl_chore_list_map00:	//From 7EE000
	dw ($E002 + 12*2)
	dw $BCD0>>1; db $80, $01, $18; dl (map_chore_list_1chk_1); dw $20; dw ($E002 + 12*1)
	dw $BD10>>1; db $80, $01, $18; dl (map_chore_list_1chk_2); dw $20; dw ($E002 + 12*2)

tbl_chore_list_map01:	//From 7EE000
	dw ($E002 + 12*2)
	dw $BD90>>1; db $80, $01, $18; dl (map_chore_list_2chk_1); dw $20; dw ($E002 + 12*1)
	dw $BDD0>>1; db $80, $01, $18; dl (map_chore_list_2chk_2); dw $20; dw ($E002 + 12*2)

tbl_chore_list_map02:	//From 7EE000
	dw ($E002 + 12*4)
	dw $BD90>>1; db $80, $01, $18; dl (map_chore_list_2chk_1); dw $20; dw ($E002 + 12*1)
	dw $BDD0>>1; db $80, $01, $18; dl (map_chore_list_2chk_2); dw $20; dw ($E002 + 12*2)

	dw $BE50>>1; db $80, $01, $18; dl (map_chore_list_3chk_1); dw $20; dw ($E002 + 12*3)
	dw $BE90>>1; db $80, $01, $18; dl (map_chore_list_3chk_2); dw $20; dw ($E002 + 12*4)

tbl_chore_list_map04:	//From 7EE000
	dw ($E002 + 12*4)
	dw $BCD0>>1; db $80, $01, $18; dl (map_chore_list_1chk_1); dw $20; dw ($E002 + 12*1)
	dw $BD10>>1; db $80, $01, $18; dl (map_chore_list_1chk_2); dw $20; dw ($E002 + 12*2)

	dw $BD90>>1; db $80, $01, $18; dl (map_chore_list_2chk_1); dw $20; dw ($E002 + 12*3)
	dw $BDD0>>1; db $80, $01, $18; dl (map_chore_list_2chk_2); dw $20; dw ($E002 + 12*4)

map_chore_list_1chk_1:
	insert "../gfx/fr/tmp/chore_list.map",0x04D0,0x20
map_chore_list_1chk_2:
	insert "../gfx/fr/tmp/chore_list.map",0x0510,0x20

map_chore_list_2chk_1:
	insert "../gfx/fr/tmp/chore_list.map",0x0590,0x20
map_chore_list_2chk_2:
	insert "../gfx/fr/tmp/chore_list.map",0x05D0,0x20

map_chore_list_3chk_1:
	insert "../gfx/fr/tmp/chore_list.map",0x0650,0x20
map_chore_list_3chk_2:
	insert "../gfx/fr/tmp/chore_list.map",0x0690,0x20

//Management Office Sign
tbl_mgmt_office_maps:
	dw tbl_mgmt_office_map00, tbl_mgmt_office_map01

tbl_mgmt_office_map00:	//From 7EE000
	dw ($E002 + 12*2)
	dw $BAA2>>1; db $80, $01, $18; dl (map_mgmt_office_full_1); dw $0C; dw ($E002 + 12*1)
	dw $BAE2>>1; db $80, $01, $18; dl (map_mgmt_office_full_2); dw $0C; dw ($E002 + 12*2)

tbl_mgmt_office_map01:	//From 7EE000
	dw ($E002 + 12*2)
	dw $BAA2>>1; db $80, $01, $18; dl (map_mgmt_office_empty_1); dw $0C; dw ($E002 + 12*1)
	dw $BAE2>>1; db $80, $01, $18; dl (map_mgmt_office_empty_2); dw $0C; dw ($E002 + 12*2)

map_mgmt_office_empty_1:
	insert "../gfx/fr/tmp/mgmt_office_sign_bg.map",0x02A2,0x0C
map_mgmt_office_empty_2:
	insert "../gfx/fr/tmp/mgmt_office_sign_bg.map",0x02E2,0x0C

map_mgmt_office_full_1:
	insert "../gfx/fr/tmp/mgmt_office_sign_bg.map",0x06A2,0x0C
map_mgmt_office_full_2:
	insert "../gfx/fr/tmp/mgmt_office_sign_bg.map",0x06E2,0x0C

//Ship Notes
tbl_ship_notes_maps:
	dw tbl_ship_notes_map00, tbl_ship_notes_map01, tbl_ship_notes_map02, tbl_ship_notes_map03, tbl_ship_notes_map04, tbl_ship_notes_map05

tbl_ship_notes_map00:
	dw ($E002 + 12*1)
	dw $B400>>1; db $80, $01, $18; dl (map_ship_notes_0); dw $0400; dw ($E002 + 12*1)
tbl_ship_notes_map01:
	dw ($E002 + 12*1)
	dw $B400>>1; db $80, $01, $18; dl (map_ship_notes_1); dw $0400; dw ($E002 + 12*1)
tbl_ship_notes_map02:
	dw ($E002 + 12*1)
	dw $B400>>1; db $80, $01, $18; dl (map_ship_notes_2); dw $0400; dw ($E002 + 12*1)
tbl_ship_notes_map03:
	dw ($E002 + 12*1)
	dw $B400>>1; db $80, $01, $18; dl (map_ship_notes_3); dw $0400; dw ($E002 + 12*1)
tbl_ship_notes_map04:
	dw ($E002 + 12*1)
	dw $B400>>1; db $80, $01, $18; dl (map_ship_notes_4); dw $0400; dw ($E002 + 12*1)
tbl_ship_notes_map05:
	dw ($E002 + 12*1)
	dw $B400>>1; db $80, $01, $18; dl (map_ship_notes_5); dw $0400; dw ($E002 + 12*1)

map_ship_notes_0:
	insert "../gfx/fr/tmp/ship_note_nums.map",0x0000,0x0400
map_ship_notes_1:
	insert "../gfx/fr/tmp/ship_note_nums.map",0x0400,0x0400
map_ship_notes_2:
	insert "../gfx/fr/tmp/ship_note_nums.map",0x0800,0x0400
map_ship_notes_3:
	insert "../gfx/fr/tmp/ship_note_nums.map",0x0C00,0x0400
map_ship_notes_4:
	insert "../gfx/fr/tmp/ship_note_nums.map",0x1000,0x0400
map_ship_notes_5:
	insert "../gfx/fr/tmp/ship_note_solve.map",0x0000,0x0400

map_call_menu_base:
	dw $2240, $2250	//<Icon>Call
	dw $2248, $2258	//Quit
map_call_menu_end:
	dw $2248, $2258
	dw $224E, $225E
map_call_menu_addr:
	dw $0b88, $0bc8	//Call
	dw $0c18, $0c58	//Quit

size_check(free_space1, 0x20B9D)

//Free Space (2) & Script
seekFile($300000)
text_script:
	insert "../text/fr/script.bin"
	include "../text/fr/menu.asm"
	insert "../text/fr/items.bin"
	db $FF

text_script_end:
skipBank()
	insert gfx_chapter1_ani,"../text/fr/chapter1.bin"
	insert gfx_chapter2_ani,"../text/fr/chapter2.bin"
	insert gfx_chapter3_ani,"../text/fr/chapter3.bin"
	insert gfx_chapter4_ani,"../text/fr/chapter4.bin"
	insert gfx_chapter5_ani,"../text/fr/chapter5.bin"
	insert gfx_ship_notes_solve,"../gfx/fr/tmp/ship_note_solve.gfx"
	insert gfx_jp_mgmt_office,"../gfx/jp/56.bin",0x1000
skipBank()
	insert gfx_swooned_ani,"../text/fr/swooned.bin"

skipBank()
	//--List of Pixel Widths per Char - for VWF
	insert vwf_width_table,"../text/fr/width.tbl"
insert_free_space:
