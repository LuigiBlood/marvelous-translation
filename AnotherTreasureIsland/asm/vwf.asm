//VWF Hack by LuigiBlood
arch snes.cpu

//Doc:
//409000 - Text Rendering Buffer
//40A400 - Text Virtual Tileset
//40AE06 - Item Name (Pause Menu)
//40DBE0 - Script Pointers
//3024 - SNES CPU telling SA-1 to do something
//3026 - SA-1 response to SNES CPU

//359A - Text Virtual Tileset Offset
//35AA - Pointer to Pointer to Script
//CODE_8CE969 - Inventory

//Virtual Tileset:
//0000-01DF - Main Font
//01E0-01E1 - Space
//0200-06FF - Kanji Font
//6B - Amount
//6C - Amount
//6D XX - Special
//   18 - Inventory - Item Select
//   1A - Team Name
//   1C - Inventory - Team Select
//   32 - (Number?)
//   34 - Current Leader Name ($305E)
//   56 - Leader Name ($35AC)
//71 - Item Icon
//73 - Scroll
//74 - Line 1
//75 - Line 2
//76 - Line 3
//77 - End 1
//7F - End 2

//44*8=352 pixels wide per line for Search Mode
//48*8=384 pixels wide per line outside Search Mode
//32*8=256 pixels wide per line for Item Name in Pause Menu

//D = 3500, DB = 00
define charcurrent = $9C	//(Global) Current Char Tile
define scriptid = $AA		//(Global) Script ID * 3
define charshift = $EE		//(Global) Shift
define charsize = $F0		//(Global) Width of 8x16
define charnext = $F2		//(Global) Next Char
define itemkeep = $F4		//(Global) Keep Item
define charmode = $F6		//(Global) Rendering Mode: Variable Width (00), Fixed Width (FF)

//Experimental Border Flickering Fix (when selecting an item)
//Actually sets color palette for faces
//seekAddr($009F5D)
//	lda.b #$00

//009F3C - Inventory Palette
//Very Hacky Fixes
seekAddr($009F39)	//PC 0x1F39
	jsr itemselect_check
	db $D0	//bne
//009FEB - Normal Palette
seekAddr($009FE6)	//PC 0x1FE6
	nop
	jsl itemselect_check2

//Avoid Rerendering Item Names all the time in Item Select mode
seekAddr($9FB690)	//PC 0x2FB690
	jsr item_name_render_init
	nop
seekAddr($9FCE9F)	//PC 0x2fce9f
	jsr item_name_render_stop

//VWF Hack - Make only one half for regular and kanji chars
//VRAM Setup
seekAddr($98A025)
	ldx $9A
	lda $40A400,x
	xba
	inc
	nop; nop; nop
seekAddr($989FC7)
	xba
	inc
	nop; nop; nop; nop; nop; nop; nop; nop; nop; nop
//VRAM Setup (Journal)
seekAddr($988ABF)
	nop; nop; nop; nop; nop; nop; nop; nop
seekAddr($988B36)
	nop; nop; nop; nop; nop; nop; nop; nop
//VRAM Setup (Journal - Save)
seekAddr($989CD0)
	nop; nop; nop; nop; nop; nop; nop; nop
seekAddr($989D47)
	nop; nop; nop; nop; nop; nop; nop; nop
//Team Name Entry
seekAddr($989107)
	nop; nop; nop; nop; nop; nop; nop
seekAddr($989110)
	nop; nop
//00-01
seekAddr($9FBA71)
	nop; nop; nop; nop; nop
seekAddr($9FBA81)
	nop; nop; nop; nop
seekAddr($9FBA8A)
	nop; nop
//02-03
seekAddr($9FBABA)
	nop; nop; nop; nop; nop
seekAddr($9FBACA)
	nop; nop; nop; nop
seekAddr($9FBAD3)
	nop; nop
//04-05
seekAddr($9FBAE4)
	nop; nop; nop; nop; nop
seekAddr($9FBAF4)
	nop; nop; nop; nop
seekAddr($9FBAFD)
	nop; nop
//06-07
seekAddr($9FBB0E)
	nop; nop; nop; nop; nop
seekAddr($9FBB1E)
	nop; nop; nop; nop
seekAddr($9FBB27)
	nop; nop

//VWF Hack - Search Mode
seekAddr($97FD2C)	//SNES CPU - Text
	jsr reset_vwf_r1
	nop
	nop
	nop
seekAddr($9FB64E)	//SA-1 - Items
	jsr reset_vwf_r2
seekAddr($9FB6C9)	//SA-1 - Text
	jsr reset_vwf_r2
//-Regular Chars
seekAddr($9FBD0C)	//Left Half of Char
	jsr setup_vwf_r
seekAddr($9FBD31)	//Auto calculate right half
	ldx $9A
	lda $40A400,x
	xba
	inc
	nop; nop; nop
seekAddr($9FBD3C)	//Right Half of Char
	jsr setup_vwf_r
seekAddr($9FBD58)
	jsl next_vwf
//-Kanji Chars
seekAddr($9FBD7B)	//Left Half of Char
	jsr setup_vwf_rsk
seekAddr($9FBDA4)	//Auto calculate right half
	ldx $9A
	lda $40A400,x
	xba
	inc
	nop; nop; nop
seekAddr($9FBDAF)	//Right Half of Char
	jsr setup_vwf_rsk
seekAddr($9FBDCF)
	jsl next_vwf

seekAddr($9FC03F)
	db $90
	//bcc $81B864		//Fix
seekAddr($9FC02A)
	db $B0
	//bcs $81B879		//Fix
seekAddr($9FBCD5)	//Space Fix
	nop
	nop

//VWF Hack - Small Text
seekAddr($9FDDD2)
	jsr reset_vwf_r2
seekAddr($9FE698)	//Final
	jsr reset_vwf_r2
//-Regular Chars
seekAddr($9FDF48)	//Left Half of Char
	jsr setup_vwf_rs
seekAddr($9FDF6D)	//Auto calculate right half
	ldx $9A
	lda $40A400,x
	xba
	inc
	nop; nop; nop
seekAddr($9FDF78)	//Right Half of Char
	jsr setup_vwf_rs
seekAddr($9FDF94)
	jsl next_vwf
//-Kanji Chars
seekAddr($9FDFB7)	//Left Half of Char
	jsr setup_vwf_rsk
seekAddr($9FDFE0)	//Auto calculate right half
	ldx $9A
	lda $40A400,x
	xba
	inc
	nop; nop; nop
seekAddr($9FDFEB)	//Right Half of Char
	jsr setup_vwf_rsk
seekAddr($9FE017)
	jsl next_vwf

seekAddr($9FDF28)	//Space Fix
	nop
	nop

//VWF Hack - Team / Leader Name (Search Mode)
seekAddr($9FBDF2)
	jsr setup_vwf_team

seekAddr($9FBE25)
	jsr setup_vwf_team3
seekAddr($9FBE39)
	jsr next_vwf_team
	nop

seekAddr($9FBE7C)
	jsr setup_vwf_team3
seekAddr($9FBE90)
	jsr next_vwf_team
	nop

//VWF Hack - Team / Leader Name (Small Text)
seekAddr($9FE069)
	jsr setup_vwf_team

seekAddr($9FE09C)
	jsr setup_vwf_team3
seekAddr($9FE0B0)
	jsr next_vwf_team
	nop

seekAddr($9FE0F3)
	jsr setup_vwf_team3
seekAddr($9FE107)
	jsr next_vwf_team
	nop


seekAddr($97FD70)
reset_vwf_r1:
	phd
	pea $3500
	pld
	jsl reset_vwf
	pld
	jsl $9FB689
	rts

seekAddr($9FFFA0)
reset_vwf_r2:
	jsl reset_vwf
	rts

setup_vwf_rsk:
	and.w #$07FF
	bra setup_vwf_r
setup_vwf_rs:
	and.w #$03FF
setup_vwf_r:
	jsl setup_vwf
	rts

reset_vwf_ri:
	jsl reset_vwf_direct
	lda.w #$7F7F
	rts

setup_vwf_team:
	pha
	asl
	sta {charnext}
	jsl setup_vwf
	pla
	asl; asl; asl
	rts
setup_vwf_team3:
	pha
	lda {charnext}
	inc
	jsl setup_vwf
	pla
	clc
	adc.w #$0020
	rts
next_vwf_team:
	jsl next_vwf
	dec $9A
	lda {charcurrent}
	rts

item_name_render_init:
	stz {itemkeep}
	lda $5C
	cmp.b #$70
	rts

item_name_render_stop:
	pha
	lda $5A
	cmp {itemkeep}
	beq +
	sta {itemkeep}
	pla
	jmp $BFDC
+;	pla
	rts

bound_check($300000)

//VWF Hack - Item Name in Pause Menu
seekAddr($9FBA48)
	jsr reset_vwf_ri
seekAddr($00F2B3)	//Left Half of Char
	jsr setup_vwf_ri1
seekAddr($00F2DB)	//Auto calculate right half
	ldx $9A
	lda $40A400,x
	xba
	inc
	nop; nop; nop
seekAddr($00F2E6)	//Right Half of Char
	jsr setup_vwf_ri2
seekAddr($00F307)	
	jsl next_vwf
seekAddr($00F2A1)
	cmp.w #$002E
	db $90

seekAddr($00FD00)
setup_vwf_ri1:
	and.w #$03FF
	jsl setup_vwf
	rts

setup_vwf_ri2:
	and.w #$07FF
	jsl setup_vwf
	rts

itemselect_check:
	lda $33BA
	bne ++

	lda $302F
	cmp.b #$09	//Overworld - Item
	beq +
	cmp.b #$07	//Search - Item
	bne +
	
	lda $3554
	cmp.b #$13
	beq +
	cmp.b #$28
+;	rts
+;	lda.b #$00
	rts


seekAddr($9FBF97)
//--Search Mode VWF Rendering
render_vwf_search:
	ldy.w #$0000
	lda.w #$0007
	sta $0F
	-;
	//Upper Tile
	pea $0000
	lda [$04],y
	jsl render_vwf_search_manage
	pla

	//Lower Tile
	pea $0100
	lda [$08],y
	jsl render_vwf_search_manage
	pla

	inx
	inx
	iny
	iny
	dec $0F
	bpl -
	rts
bound_check($2FBFDB)

seekAddr($9FE02E)
//--Small Text VWF Rendering
render_vwf_small:
	ldy.w #$0000
	lda.w #$0007
	sta $0F
	-;
	//Upper Tile
	pea $0000
	lda [$04],y
	jsl render_vwf_small_manage
	pla

	//Lower Tile
	pea $0100
	lda [$08],y
	jsl render_vwf_small_manage
	pla

	inx
	inx
	iny
	iny
	dec $0F
	bpl -
	rts
bound_check($2FE068)

seekAddr($00F3A0)
//--Inventory VWF Rendering
render_vwf_inventory:
	lda.w #$0007
	sta $0F
	-;
	//Upper Tile
	lda [$04],y
	jsl render_vwf_inventory1

	//Lower Tile
	lda [$08],y
	jsl render_vwf_inventory2

	inx
	inx
	iny
	iny
	dec $0F
	bpl -
	rts
bound_check($0073BA)


seekAddr(text_script_end)
//vwf routine here, A = gfx src, X = gfx dst, Y = vertical pixel
//16-bit A / Index

//--Reset VWF Vars
reset_vwf_direct:
	stz {charshift}
	stz {charsize}
	rtl

reset_vwf:
	//A = Command
	pha
	cmp #($6B-$62)	//Amount
	beq _reset_vwf_skip
	cmp #($6C-$62)	//Amount
	beq _reset_vwf_skip
	cmp #($6D-$62)	//Icon
	beq _reset_vwf_skip
	cmp #($71-$62)	//Item Icon?
	beq _reset_vwf_skip
	cmp #($73-$62)	//Scroll
	beq _reset_vwf_zero
	cmp #($74-$62)	//Line 1
	beq _reset_vwf_zero
	cmp #($75-$62)	//Line 2
	beq _reset_vwf_zero
	cmp #($76-$62)	//Line 3
	beq _reset_vwf_zero
	cmp #($77-$62)	//End 1
	beq _reset_vwf_zero
	cmp #($7F-$62)	//End 2
	beq _reset_vwf_zero
-;	pla
	sep #$30
	asl
	rtl

_reset_vwf_zero:
	//Reset Shift and Tile Size
	stz {charshift}
	stz {charsize}
	bra -

_reset_vwf_skip:
	//Space padding for Icons that require *even* tile offset to work properly.
	lda {charcurrent}
	bit.w #$0001
	bne +
	lda {charshift}
	beq _reset_vwf_zero
+;	lda {charcurrent}
	inc
	bit.w #$0001
	beq +
	inc
+;	bit.w #$0010
	beq +
	clc
	adc.w #$0010
+;	sta {charcurrent}
	bra _reset_vwf_zero

reset_vwf_skip:
	//Space padding for Icons that require *even* tile offset to work properly.
	pha
	lda {charcurrent}
	bit.w #$0001
	bne +
	lda {charshift}
	beq _reset_vwf_returnzero
+;	lda {charcurrent}
	inc
	bit.w #$0001
	beq +
	inc
+;	bit.w #$0010
	beq +
	clc
	adc.w #$0010
+;	sta {charcurrent}
_reset_vwf_returnzero:
	pla
reset_vwf_zero:
	stz {charshift}
	stz {charsize}
	rtl

mode_fixed_width:
	stz {charmode}
	dec {charmode}
	bra reset_vwf_zero

mode_variable_width:
	stz {charmode}
	bra reset_vwf_zero


//--VWF Rendering
render_vwf_main:
	//X = Render Address
	//Stack:
	//$01 - 16b 1st Tile Addr
	//$03 - 16b 2nd Tile Addr
	//$05 - 16b Return Address
	//$07 - 16b First Half
	//$09 - 16b Second Half
	phx
	phx
	jsr render_vwf_addr

	lda {charshift}
	beq +

	plx
	sep #$20

	lda $07-2,s
	and $0D
	sta $07-2,s
	lda $08-2,s
	and $0D
	sta $08-2,s

	lda $409000,x
	and $0C
	xba
	lda $409001,x
	and $0C
	xba

	rep #$20

	ora $07-2,s
	sta $409000,x
	bra ++

+;	plx
	lda $07-2,s
	sta $409000,x

+;	plx
	sep #$20
	lda $09-4,s
	and $0C
	sta $09-4,s
	lda $0A-4,s
	and $0C
	sta $0A-4,s

	lda $409010,x
	and $0D
	xba
	lda $409011,x
	and $0D
	xba
	rep #$20

	ora $09-4,s
	sta $409010,x

	rts

render_vwf_addr:
	//Wrap for second tile
	txa
	and.w #$00F0
	cmp.w #$00F0
	bcc +
	txa
	clc
	adc.w #$0100
	sta $03+2,s

	//Deal with calc error
+;	txa
	and.w #$0100
	beq +
	clc
	adc $01+2,s
	sta $01+2,s
	sta $03+2,s

+;	lda $01+2,s
	clc
	adc $16,s
	sta $01+2,s
	lda $03+2,s
	clc
	adc $16,s
	sta $03+2,s

	rts

render_vwf_shift:
	and.w #$00FF
	xba
render_vwf_shift2:
	phx
	ldx {charshift}
	beq +
-;	lsr
	dex
	bne -
+;	plx
	rts

render_vwf_search_manage:
			//$0E - Address (from 409000)
			//$0B - Return
	phy		//$09
	phx		//$07
	pha		//$05
	pha		//$03
	pha		//$01

	xba
	pha
	and $05+2,s
	sta $0C
	pla
	and.w #$00FF
	eor.w #$00FF
	ora $05,s
	eor.w #$FFFF
	ora $0C

render_vwf_generic_manage:
	sta $0C

	jsr render_vwf_shift

	sep #$20
	sta $03,s
	xba
	sta $01,s
	rep #$20
	
	lda $0C
	xba
	jsr render_vwf_shift

	sep #$20
	sta $04,s
	xba
	sta $02,s
	rep #$20

	lda.w #$00FF
	jsr render_vwf_shift
	sta $0C

	jsr render_vwf_main

	pla
	pla
	pla
	plx
	ply
	rtl


render_vwf_small_manage:
			//$0E - Address (from 409000)
			//$0B - Return
	phy		//$09
	phx		//$07
	pha		//$05
	pha		//$03
	pha		//$01

	xba
	pha
	and $05+2,s
	sta $0C
	pla
	and.w #$00FF
	eor.w #$00FF
	ora $05,s

	jmp render_vwf_generic_manage

render_vwf_inventory1:
	pea $1E06
	jsl render_vwf_inventory_manage
	pla
	rtl
render_vwf_inventory2:
	pea $1F06
	jsl render_vwf_inventory_manage
	pla
	rtl

render_vwf_inventory_manage:
			//$0E - Address (from 409000)
			//$0B - Return
	phy		//$09
	phx		//$07
	pha		//$05
	pha		//$03
	pha		//$01

	jmp render_vwf_generic_manage


//--Setup Char to be rendered
setup_vwf:
	//16-bit A / Index
	//A = Char ID
	phx
	phy
	pha

	bit {charmode}
	bmi setup_vwf_fixed
	
	tay
	lsr
	tax
	lda width_list,x	//Get Char Width
	and.w #$00FF
	tax
	tya
	bit.w #1
	beq setup_vwf_1
	
setup_vwf_2:
	txa					//If Char ID is Odd (Right Half)
	sec					//Then Size = Width - 8
	sbc.w #8			//If Size < 0 then Size = 0
	//bmi setup_vwf_0
	bra setup_vwf_end

setup_vwf_1:
	txa					//If Char ID is Even (Left Half)
	cmp.w #8			//If Width > 8 then Size = 8
	bcc setup_vwf_end	//Else Size = Width
	lda.w #8
	bra setup_vwf_end

setup_vwf_0:
	lda.w #0
	bra setup_vwf_end

setup_vwf_fixed:
	lda.w #8
setup_vwf_end:
	sta {charsize}
	
	pla
	ply
	plx
	
	rtl
	
	+;
	lda.w #8
	sta {charsize}
	
	pla
	ply
	plx
	
	rtl

//--Setup Next Char and update shift and size
next_vwf:
	//16-bit A / Index
	pha
	phx
	phy
	
	lda {charsize}
	bne +
	//If Char Size == 0 then do not go to next tile
	dec {charcurrent}
	clc
	adc {charshift}
	bra ++

	//If Char Size != 0 then check if next tile is needed
+;	clc
	adc {charshift}
	cmp.w #$0008
	bcs +
	dec {charcurrent}

	//If Size + Shift < 0 then go back a tile
+;
	bpl +
-;	clc
	adc.w #$0008
	dec {charcurrent}
	bmi -
	dec {charcurrent}
+;	and.w #$0007
	sta {charshift}
	
	ply
	plx
	pla
	
	inc {charcurrent}
	inc $9A
	
	rtl

//--Check for Spaces / Script ID for sounds
enqueue pc
seekAddr($9FBCF4)
	jsl space_check_sound
seekAddr($9FDF37)
	jsl space_check_sound
dequeue pc

space_check_sound:
	pha
	phx
	php
	rep #$30

	//Check if it's a Script ID that doesn't need sound
	lda {scriptid}
	ldx.w #(script_check_sound_table_end-script_check_sound_table-2)

-;	cmp script_check_sound_table,x
	beq +
	dex
	dex
	bpl -

	//Check if the char being rendered is a space
	ldx $9A
	lda $40A400,x
	ldx.w #(space_check_sound_table_end-space_check_sound_table-2)
	xba
	lsr

-;	cmp space_check_sound_table,x
	beq +
	dex
	dex
	bpl -

	//Make a sound
	plp
	plx
	pla
	jsl $00FC1A
	rtl
	//Don't make a sound
+;	plp
	plx
	pla
	rtl
//Characters that shouldn't make a sound (spaces and others)
space_check_sound_table:
	dw $1A, $E0, $E1, $E2, $E3, $E4, $E5, $EF, $F0
space_check_sound_table_end:
//Script IDs (*3) that shouldn't make a sound entirely
script_check_sound_table:
	dw 39*3, 40*3
script_check_sound_table_end:

//Hacky VWF Fixes
//-Search Mode Inventory Fix
itemselect_check2:
	lda $4210
	lda $47
	beq +

	lda $302F
	cmp.b #$09	//Overworld - Item
	beq +
	cmp.b #$07	//Search - Item
	bne +
	
	lda $3554
	cmp.b #$13
	beq +
	cmp.b #$28
+;	rtl

//Turning Cross Puzzle Fixes
enqueue pc
seekAddr($9FCC11)
	jsl fix_special_turning_puzzle1; nop
seekAddr($9FCC5F)
	jsl fix_special_turning_puzzle2
dequeue pc

fix_special_turning_puzzle1:
	jsl mode_fixed_width	//Fixed Width Mode
	//Do what the original code was doing
	ldx $02
	lda $9F7F0E,x
	rtl

fix_special_turning_puzzle2:	//Variable Width Mode for "OK?"
	jsl mode_variable_width
	//Do what the original code was doing
	clc
	adc.w #$0005
	rtl

//Watering Robot Path Fixes
enqueue pc
seekAddr($9FCB1D)
	jsl fix_waterrobotpath1; nop; nop
dequeue pc

fix_waterrobotpath1:
	jsl reset_vwf_zero
	//Do what the original code was doing
	lda $302A
	and.w #$0010
	rtl

//Half Char for Luck Rock Amount Fixes
enqueue pc
seekAddr($9FC072)
	nop; nop; nop; nop; nop
seekAddr($9FC07D)
	nop; nop; nop; nop

seekAddr($9FC0B8)
	nop; nop; nop; nop; nop
seekAddr($9FC0C3)
	nop; nop; nop; nop

seekAddr($9FC0FE)
	nop; nop; nop; nop; nop
seekAddr($9FC109)
	nop; nop; nop; nop

seekAddr($9FC125)
	nop; nop; nop; nop; nop
seekAddr($9FC130)
	nop; nop; nop; nop
dequeue pc

//Fix Stuck Events (Breakpoint $8CE327)
//-- Breakpoint $8CE304 - Event Set Script ID?
//-- Breakpoint $8CE32D - Event Check
enqueue pc
seekAddr($038DB9)	//SA-1 / Ch.3 - Town Manager and Lunch Box (Script ID: 203)
	jsl event_char_detection
	nop
	db $90	//BCC
seekAddr($039424)	//SA-1 / Ch.3 - Lunch Box to Husband (0x4AA / Script ID: 398)
					//This one is odd... It never triggers, and performs the same thing as the next one
					//Disable it to avoid conflicts
	rtl 
	//jsl event_char_detection
	//nop
	//db $90	//BCC
seekAddr($04E6BA)	//SNES / Ch.3 - Lunch Box to Husband (0x4AA / Script ID: 398)
					//Stop the Eating animation when he asks if you have the key
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($04F264)	//SNES / Ch.3 - Mike and Lunch Box (Script ID: 174)
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($04F2AA)	//SNES / Ch.3 - Mike and Forgotten Doll Choice (Script ID: 175)
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($06E9AC)	//SNES / Ch.3 - Boxing Man, after giving the coin (0x181B / Script ID: 2057)
					//When Laughing
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($06E9C4)	//SNES / Ch.3 - Boxing Man, after giving the coin (0x181B / Script ID: 2057)
					//After Laughing
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($07EB49)	//SNES / Ch.4 - When Polly tickles the bird at the start (0x474 - Script ID: 380)
					//63 - When she becomes angry at the second sentence
	jsl event2_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($07ED2C)	//SNES / Ch.4 - After the bird is gone, when Polly says not to worry (0x471 / Script ID: 379)
					//FF - After she says she brought 3 giants, she faces you
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($07EF2B)	//SNES / Ch.4 - When Polly tickles the bird at the start (0x474 - Script ID: 380)
					//62 - After she says "Not so easily!", this code is weird
					//She moves her glasses, has to be continuously called, must have [Event][np]
	jsl eventnp_char_detection
	nop; nop
	sep #$20
	db $B0	//BCS
seekAddr($13F938)	//SNES / Ch.3 - When the baby calms down after giving the doll (0x498 / Script ID: 392)
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($8FAE68)	//SNES / Ch.2 - When Ms. Sisko talks to the kids after getting the Crystal Ball [1CA4] (Script ID: 2444)
					//The moment when she talks about being concerned about your teacher
	jsl event_char_detection
	nop; nop
	db $90	//BCC
seekAddr($8FAE70)	//This part prevents an accidental trigger (when it's above 0x200), we can remove it
	nop; nop; nop
	nop; nop

seekAddr($8FAE87)	//SNES / Ch.2 - When Ms. Sisko talks to the kids after getting the Crystal Ball (Script ID: 2444)
					//The moment when she wonders if she has seen you before
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
//seekAddr($99DB7C)	//SNES / Ch.4 - After the Boss, when Polly thanks you (0x1260 / Script ID: 1568)
					//???? THIS IS USELESS CODE, WTF, there wouldn't be a single change in the results
					//No change needed
	//jsl event_char_detection
	//nop; nop
	//sep #$20
	//db $90	//BCC
dequeue pc

event_char_detection:
	phx
	php
	rep #$30
	ldx $359A
	lda $40A400,x
	xba
	cmp.w #$E4*2
	beq +
	plp
	plx
	clc
	rtl
+;	plp
	plx
	sec
	rtl

eventnp_char_detection:
	phx
	php
	rep #$30
	ldx $359A
	dex
	dex
	lda $40A400,x
	xba
	cmp.w #$E4*2
	beq +
	plp
	plx
	clc
	rtl
+;	plp
	plx
	sec
	rtl

event2_char_detection:
	phx
	php
	rep #$30
	ldx $359A
	lda $40A400,x
	xba
	cmp.w #$E5*2
	beq +
	plp
	plx
	clc
	rtl
+;	plp
	plx
	sec
	rtl


//--List of Pixel Widths per Char
width_list:
	insert "../text/en_new/width.tbl"
