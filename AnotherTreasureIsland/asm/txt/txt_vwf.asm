//VWF Hack by LuigiBlood
setLoROMBase()

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
//CODE_9FBA3A - Prepare Virtual Tileset Buffer from Text (set $35AA first)

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
define charmode = $F6		//(Global) Rendering Mode: Variable Width (00), Fixed Width (FF)

include "txt_vwf_search.asm"
include "txt_vwf_small.asm"
include "txt_vwf_pause.asm"
//include "txt_vwf_wram.asm"	//DO NOT USE IT.
include "txt_vwf_fix.asm"

//Reset every time new text is loaded
enqueue pc
seekAddr($9FBA4B)
	jsl vwf_reset_pause
dequeue pc

vwf_reset_pause:
	sta $40A400
	jsl vwf_reset
	rtl

//--Set Fixed Width Mode
vwf_mode_fixed_width:
	stz {charmode}
	dec {charmode}
	bra vwf_reset

//--Set Variable Width Mode
vwf_mode_variable_width:
	stz {charmode}

//--Reset VWF Vars
vwf_reset:
	stz {charshift}
	stz {charsize}
	rtl

//--Check Command, and if we should do padding or reset
vwf_check_char:
	//A = Command
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
	rtl
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
_reset_vwf_zero:
	jml vwf_reset

//--Render Half Char
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
	jsr _render_vwf_addr

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

_render_vwf_addr:
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

_render_vwf_shift:
	and.w #$00FF
	xba
	phx
	ldx {charshift}
	beq +
-;	lsr
	dex
	bne -
+;	plx
	rts

render_vwf_generic_manage:
	lda $0C
	jsr _render_vwf_shift

	sep #$20
	sta $03,s
	xba
	sta $01,s
	rep #$20
	
	lda $0C
	xba
	jsr _render_vwf_shift

	sep #$20
	sta $04,s
	xba
	sta $02,s
	rep #$20

	lda.w #$00FF
	jsr _render_vwf_shift
	sta $0C

	jsr render_vwf_main

	pla
	pla
	pla
	plx
	ply
	rtl

//--Setup Char to be rendered
vwf_setup:
	//16-bit A / Index
	//A = Char ID
	phx
	phy
	pha

	bit {charmode}
	bmi _setup_vwf_fixed
	
	tay
	lsr
	tax
	lda vwf_width_table,x	//Get Char Width
	and.w #$00FF
	tax
	tya
	bit.w #1
	beq _setup_vwf_1
	
_setup_vwf_2:
	txa					//If Char ID is Odd (Right Half)
	sec					//Then Size = Width - 8
	sbc.w #8			//If Size < 0 then Size = 0
	//bmi setup_vwf_0
	bra _setup_vwf_end

_setup_vwf_1:
	txa					//If Char ID is Even (Left Half)
	cmp.w #8			//If Width > 8 then Size = 8
	bcc _setup_vwf_end	//Else Size = Width
	lda.w #8
	bra _setup_vwf_end

_setup_vwf_0:
	lda.w #0
	bra _setup_vwf_end

_setup_vwf_fixed:
	lda.w #8
_setup_vwf_end:
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
vwf_next:
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
