//Insert Data

//Clean Japanese Script
seekFile($21B400)
fill 0x20B9D,$FF

//Graphics

//-Font
seekFile($2AC000)
	insert "../text/en_new/font.bin"
seekFile($270000)
	insert "../text/en_new/kanji.bin"

//--Intro

//-Menu

//--Search Menu Icons
seekFile($2B6000)
	insert "../gfx/en_new/menu_gfx.bin"

//--Misc HUD
seekFile($268000)
	insert "../text/en_new/icons.bin"	//TransPutt Integration

//--Journal Menu Tilemap Hacks
seekFile($2C09B0)	//SELECTでゲーム画面た & Move & Select Text Hack
map_journal1:
	insert "../gfx/en_new/journal1_map.bin"
seekFile($2C1189)	//"Save"
map_journal2:
	insert "../gfx/en_new/journal2_map.bin"
seekFile($2C18C8)	//#に記録していいですか？
					//"Wanna save to entry #?"
map_journal3:
	insert "../gfx/en_new/journal3_map.bin"
seekFile($2C19BB)	//Change place to entry number
	sta $7F00B2
seekFile($2C1E1E)	//Change place to entry number (Save & Exit)
	sta $7F00B2
seekFile($2C1AAF)	//#に記録しました。
					//Journal entry # has been saved.
map_journal4:
	insert "../gfx/en_new/journal4_map.bin"
seekFile($2C1B1E)	//Change place to entry number
	sta $7F00AC
seekFile($2C1F12)	//Change place to entry number (Save & Exit, see code.asm)
	sta $7F00AC


seekFile($2BB96A)
map_ch1_ship_note_13:
	dw $01AC, $01AD, $01AC, $01AE, $01AF, $01B4, $01B1
	dw $01B2, $01B3, $01B2, $01B1, $01B5, $01B6, $01B7
seekFile($2BBAC6)
map_ch1_ship_note_1:
	dw $01CF, $01D0, $01D1, $01B1, $01B7, $01B1
	dw $01D2, $01D3, $01CE, $01DB, $01DC, $01B1
	dw $01D4, $01D5, $01D9, $01DA, $01B7, $01B1
	dw $01D6, $01D7, $01D8, $01CE, $01DB, $01DC
	dw $01B7, $01B1, $01B7, $01B1, $01B7, $01B1
seekFile($2D0E70)
map_ch1_ship_note_2:
	dw $1E00, $1E46, $1E10, $1E56, $1E4C, $1E6C
	dw $1E5C, $1E7C, $1E6F, $1E6E, $1E7F, $1E7E
	dw $1E6F, $1E00, $1E7F, $1E10, $1E4E, $1E4F
	dw $1E5E, $1E5F, $1E6A, $1E6B, $1E7A, $1E7B
	dw $1E4B, $1E4C, $1E5B, $1E5C, $1E4D, $1E00
	dw $1E5D, $1E10, $1E6F, $1E6D, $1E7F, $1E7D
	dw $1E4F, $1E6B, $1E5F, $1E7B, $1E6E, $1E6A
	dw $1E7E, $1E7A, $1E46, $1E6E, $1E56, $1E7E
	dw $1E47, $1E6F, $1E57, $1E7F, $1E6E, $1E47
	dw $1E7E, $1E57, $1E6F, $1E00, $1E7F, $1E10


//--Large Messages
//Monkey Screech, "HEY!", "That's Enough / Cut it OUT!"
seekFile($2CE000)
	insert "../gfx/en_new/font_large.bin"

//Leader Names
seekFile($2FC8D7)
	dw $03, $30, $36, $35	//Dion
	dw $0C, $28, $3F, $EF	//Max
	dw $09, $28, $2A, $32	//Jack

//Turning Cross Puzzle
seekFile($2FCCA4)
	lda.w #$000E		// O
seekFile($2FCCAA)
	lda.w #$000A		// K
seekFile($2FCCB0)
	lda.w #$0046		// ?
seekFile($2FCC4E)
	lda.w #$0048		// /

//Watering Robot Path
seekAddr($9FCB40)
	lda.w #$000E		// O
seekAddr($9FCB46)
	lda.w #$000A		// K
seekAddr($9FCB4C)
	lda.w #$0046		// ?

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
	nop; nop; nop; nop; nop
	nop; nop; nop; nop; nop
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

//Palette Changes
seekFile($2CAF40)
pal_ch1_patchiesnote:
	insert "../gfx/en_new/tmp/patchies_stuck_note.pal"
seekFile($2CAFA0)
pal_ch1_ginaransomletter:
	insert "../gfx/en_new/tmp/gina_ransom_letter.pal"
seekFile($2CAFE0)
pal_ch1_camptips:
	insert "../gfx/en_new/tmp/camp_tips.pal"
seekFile($2CB5E0)
pal_ch2_chorelist:
	insert "../gfx/en_new/tmp/chore_list.pal"
seekFile($2C8820)
pal_ch2_bensongrave:
	insert "../gfx/en_new/tmp/benson_grave_note.pal"
seekFile($2C8B60)
pal_ch3_mgmtofficesign_bg:
	insert "../gfx/en_new/tmp/mgmt_office_sign_bg.pal"
seekFile($2C9EE0)
pal_ch3_mgmtofficesign_spr:
	insert "../gfx/en_new/tmp/mgmt_office_sign_spr.pal"

//Free Space (1)
seekFile($21B400)
free_space1:

map_teamname:			//18 - $0E286B
	insert "../gfx/en_new/lz/lz_teamname_map.bin.lz"

gfx_title:				//35 - $121964
	insert "../gfx/en/lz/lz_title_gfx.bin.lz"

map_title:				//38 - $123726
	insert "../gfx/en/lz/lz_title_map.bin.lz"
gfx_intro1:				//39 - $123951
	insert "../gfx/en_new/lz/39.bin.lz"
gfx_intro2:				//3A - $1246DE
	insert "../gfx/en_new/lz/3A.bin.lz"
gfx_intro3:				//3B - $12550E
	insert "../gfx/en_new/lz/3B.bin.lz"
map_intro:				//3C - $1257F6
	insert "../gfx/en_new/lz/3C.bin.lz"
pal_intro:				//3D - $125ADD
	insert "../gfx/en_new/lz/3D.bin.lz"
gfx_credits:			//3E - $125BB6
	insert "../gfx/en/lz/lz_credits_gfx.bin.lz"
map_credits:			//3F - $12735C
	insert "../gfx/en/lz/lz_credits_map.bin.lz"

//Search Mode - Tilemaps (48 to 50)
map_ch1_gina_ransom:	//48 - $12A9D0
	insert "../gfx/en_new/lz/48.bin.lz"

map_ch3_sign:			//4A - $12BDA4
	insert "../gfx/en_new/lz/4A.bin.lz"
map_ch1_patchiesnote:	//4B - $12C7C8
	insert "../gfx/en_new/lz/4B.bin.lz"

map_ch1_misc:			//4D - $12DEB0
	insert "../gfx/en_new/lz/4D.bin.lz"
map_ch1_misc2:			//4E - $12E9BA
	insert "../gfx/en_new/lz/4E.bin.lz"

//Search Mode - Graphics (51 to ??)
gfx_ch1_gina_ransom:	//53 - $132FC4
	insert "../gfx/en_new/lz/53.bin.lz"

gfx_ch3_sign:			//56 - $136BFE
	insert "../gfx/en_new/lz/56.bin.lz"

gfx_ch1_patches_stuck:	//5A - $13C578
	insert "../gfx/en_new/lz/5A.bin.lz"

gfx_ch2_bensongrave:	//5E - $142CE4
	insert "../gfx/en_new/lz/5E.bin.lz"
gfx_ch1_camptips:		//5F - $1447AE
	insert "../gfx/en_new/lz/5F.bin.lz"
gfx_ch2_monster:		//60 - $145F3B
	insert "../gfx/en_new/lz/60.bin.lz"

gfx_ch2_chorelist:		//62 - $1490F9
	insert "../gfx/en_new/lz/62.bin.lz"
gfx_ch1_controls:		//63 - $14A478
	insert "../gfx/en_new/lz/63.bin.lz"
gfx_ch1_ship_notes:		//64 - $14B628
	insert "../gfx/en_new/lz/64.bin.lz"

gfx_ch5_colonel_note2:	//69 - $151D31
	insert "../gfx/en/lz/lz_colonel_note_gfx2.bin.lz"

//Sprites (B9 to F8)
gfx_kick_smash_minigame://D9 - $1D860C
    insert "../gfx/en_new/lz/D9.bin.lz"
gfx_title_nintendo:		//DA - $1D948F
	insert "../gfx/en_new/lz/lz_nintendo_gfx.bin.lz"
gfx_title_sub:			//DB - $1DA5ED
	insert "../gfx/en_new/lz/lz_subtitle_gfx.bin.lz"

gfx_mgmt_office_spr:	//E0
	insert "../gfx/en_new/lz/E0.bin.lz"

gfx_ch5_colonel_note1:	//F8 - $1FE99C
	insert "../gfx/en/lz/lz_colonel_note_gfx1.bin.lz"

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
	insert "../gfx/en_new/tmp/chore_list.map",0x04D0,0x20
map_chore_list_1chk_2:
	insert "../gfx/en_new/tmp/chore_list.map",0x0510,0x20

map_chore_list_2chk_1:
	insert "../gfx/en_new/tmp/chore_list.map",0x0590,0x20
map_chore_list_2chk_2:
	insert "../gfx/en_new/tmp/chore_list.map",0x05D0,0x20

map_chore_list_3chk_1:
	insert "../gfx/en_new/tmp/chore_list.map",0x0650,0x20
map_chore_list_3chk_2:
	insert "../gfx/en_new/tmp/chore_list.map",0x0690,0x20

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
	insert "../gfx/en_new/tmp/mgmt_office_sign_bg.map",0x02A2,0x0C
map_mgmt_office_empty_2:
	insert "../gfx/en_new/tmp/mgmt_office_sign_bg.map",0x02E2,0x0C

map_mgmt_office_full_1:
	insert "../gfx/en_new/tmp/mgmt_office_sign_bg.map",0x06A2,0x0C
map_mgmt_office_full_2:
	insert "../gfx/en_new/tmp/mgmt_office_sign_bg.map",0x06E2,0x0C


size_check(free_space1, 0x20B9D)

//Free Space (2) & Script
seekFile($300000)
text_script:
	insert "../text/en_new/script.bin"
	include "../text/en_new/menu.asm"
	insert "../text/en_new/items.bin"
	db $FF

text_script_end: