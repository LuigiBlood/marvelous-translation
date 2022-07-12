//Code ASM Hacks
setLoROMBase()

//Relocate Script to 0x300000 / $F0:0000
enqueue pc
seekAddr($00FC82)	//PC 0x7C82
asm_relocate_script:
	lda.w #text_script			//Address
	sta $40DBE0
	sta $08
	lda.w #(text_script >> 16)	//Bank
dequeue pc

//ASM Hack to disable paging on the Team naming screen
enqueue pc
seekAddr($988FB1)	//PC 0x2C0FB1
asm_disable_paging:
	lda.b #0
dequeue pc

//Fix for Save & Quit Journal Menu ($2C1EE2)
enqueue pc
seekAddr($989ED2)	//PC 0x2C1ED2
asm_menu_fix:
	lda $9AAD,x
	sta $7F009A,x
	lda $9ACB,x
	sta $7F00DA,x
	inx
	inx
	cpx.b #$1E
	bne asm_menu_fix //$EC
	
	fill 36,$EA	//Fill NOPs
	
	lda $75E8
	asl
	clc
	adc.w #$30A0
	sta $7F009A
dequeue pc

//Easier Team Naming Controls
//B = Backspace
//A = Enter Char
//START = Begin
//Odd = BYETUDLR, Even = AXLR...

//$2C0F75 - $988F75 - START Button (don't touch)
//$2C0FB1 - $988FB1 - L/R Buttons
//$2C0FFE - $988FFE - Left/Right D-Pad (don't touch)
//$2C1032 - $989032 - Up/Down D-Pad (don't touch)
//$2C10A3 - $9890A3 - B Button
//$2C10A9 - $9890A9 - X Button
//$2C10B2 - $9890B2 - Y Button
//$2C10C1 - $9890C1 - A Button (don't touch)
//$7614 - Current Team Name Char
//$9890E6 - Delete Current Char
//$989157 - Go Back one char
enqueue pc
seekAddr($9890A3)	//PC 0x2C10A3
	lda $F3
	bit.b #$80
	beq +
	jsr $9157
	jmp $90E6
+;	jmp $90C1
dequeue pc

//Chore List Tilemap Edit Check ($2BB5F5 / $97B5F5)
//7EE000 - 16-bit VRAM Upload Pointer / End Address (uses this to figure out when it ends)
//Repeats:
//0x00 - VRAM Word Address
//0x02 - VRAM Address Increment Mode
//0x03 - DMA Parameters
//0x04 - VRAM Write Address for DMA (0x18)
//0x05 - Full Address for DMA
//0x08 - Size (bytes)
//0x0A - Address to next VRAM upload batch
//0x0C - Data

//Little Endian:
//Header 12 bytes
//4E5E 81 01 18 0EE07E 1400 22E0 <Data, 14 bytes>
//VRAM Addr Mode: After accessing high byte, and increment by 32 word address (64 bytes)
//DMA Param: Transfer 2 bytes (16 bit) for VRAM
//Top Left, Bottom Left, Top Right, Bottom Right

//Is only called when a chore is done.

enqueue pc
seekAddr($97B5F5)
	jml asm_chore_list_check
dequeue pc
asm_chore_list_check:
	txa
	lsr
	sec
	sbc.w #$00FF
	//Value:
	//00 = X1  2  3
	//01 =  1 X2  3
	//02 =  1 X2 X3
	//03 =  1 X2  3
	//04 = X1 X2  3
	cmp.w #$0005
	bcc +

	jml $97B5FB
+;	asl
	tay

	phb
	sep #$20
	lda.b #(tbl_chore_list_maps >> 16)
	pha
	plb
	rep #$20
	//Get DMA Table Addr
	lda tbl_chore_list_maps,y
	sta $04
	//Get DMA Table End Addr (Size)
	lda ($04)
	and.w #$0FFF
	dec
	ldx $04
	ldy.w #$E000
	mvn $7E=(tbl_chore_list_maps >> 16)
	plb
	jml $97B6CC
	rts

//Management Office Tilemap Full ($97B6DD)
//Same as Chore List
enqueue pc
seekAddr($97B6DD)
	jml asm_mgmt_office_remap
dequeue pc
asm_mgmt_office_remap:
	txa
	lsr
	sec
	sbc.w #$00A4
	//Value:
	//00 = Full Sign
	//01 = 231 Sign (do not touch)
	beq +
	jml $97B6E3
+;	asl
	tay

	phb
	sep #$20
	lda.b #(tbl_mgmt_office_maps >> 16)
	pha
	plb
	rep #$20
	//Get DMA Table Addr
	lda tbl_mgmt_office_maps,y
	sta $04
	//Get DMA Table End Addr (Size)
	lda ($04)
	and.w #$0FFF
	dec
	ldx $04
	ldy.w #$E000
	mvn $7E=(tbl_mgmt_office_maps >> 16)
	plb
	jml $97B781
	rts

//Ship Notes - Numbers ($97B9F6)
//Same as Chore List
enqueue pc
seekAddr($97B9F6)	//Which note
	jml asm_shipnote_remap
dequeue pc
asm_shipnote_remap:
	txa
	lsr
	sec
	sbc.w #$0104
	//Value:
	//0 = 8+8-3=?
	//1 = Sike!
	//2 = 12358
	//3 = Upside Down 1436
	//4 = 7654321 (UNUSED? We won't do anything to it just in case)
	cmp.w #$0004
	bcc _asm_shipnote_remap_do
	jml $97B9FC
_asm_shipnote_remap_do:
	asl
	tay

	phb
	sep #$20
	lda.b #(tbl_ship_notes_maps >> 16)
	pha
	plb
	rep #$20
	//Get DMA Table Addr
	lda tbl_ship_notes_maps,y
	sta $04
	//Get DMA Table End Addr (Size)
	lda ($04)
	and.w #$0FFF
	dec
	ldx $04
	ldy.w #$E000
	mvn $7E=(tbl_ship_notes_maps >> 16)
	plb
	jml $97BAC5
	rts

//Ship Notes - Letters ($97BB02)
//Same as Chore List
enqueue pc
seekAddr($97BB02)
	//No Values, just one
	lda.w #$0005
	jml _asm_shipnote_remap_do
dequeue pc

//Chapter Screen ($8DF1EC - SNES CPU)
asm_set_chapter_tilemap:
	ldx.b #0
	lda.w #$30E0
-;	sta $7F0198,x
	inc; inc; inx; inx
	cpx.b #16
	bne -
	rtl

//$2F - do +2 when changing Gameplay mode?
//$E6 - Current Char (*2)
//$FE - Timing (From 0xC0)
//$3100 - Chapter ID (*2)
//JSL $00FC35 (Play SFX, use 0x2C)

//Notes:
//$33C8 - VRAM Address (Word)
//$33CA - Full Address to DMA From
//$33CD - Size (bytes)
enqueue pc
seekAddr($8DF1E0)
	lda.b #$FF
seekAddr($8DF1EC)
	jsl asm_chapter_screen_loop
	rts
dequeue pc
asm_chapter_screen_loop:
	ldx $3100
	lda $E6
	cmp ani_chapter_frames,x
	beq +
	lda $FE
	cmp.b #(0xFF-0x30)
	bcs +
	and.b #$07
	bne +
	//VRAM DMA Setup
	rep #$20
	lda.w #$0E00/2
	sta $33C8
	lda ani_chapter_addr,x
	adc $e5
	sta $33CA
	lda ani_chapter_bank,x
	sta $33CC
	lda.w #$0200
	sta $33CD
	//Play SFX
	sep #$20
	lda.b #$2C
	jsl $00fC35

	inc $E6
	inc $E6
+;	dec $FE
	bne +
	inc $2F
	inc $2F
+;	clc; rtl

constant gfx_chapter1_ani_frames = gfx_chapter1_ani.size / 0x200
constant gfx_chapter2_ani_frames = gfx_chapter2_ani.size / 0x200
constant gfx_chapter3_ani_frames = gfx_chapter3_ani.size / 0x200
constant gfx_chapter4_ani_frames = gfx_chapter4_ani.size / 0x200
constant gfx_chapter5_ani_frames = gfx_chapter5_ani.size / 0x200

ani_chapter_frames:
	dw gfx_chapter1_ani_frames*2
	dw gfx_chapter2_ani_frames*2
	dw gfx_chapter3_ani_frames*2
	dw gfx_chapter4_ani_frames*2
	dw gfx_chapter5_ani_frames*2
ani_chapter_addr:
	dw gfx_chapter1_ani
	dw gfx_chapter2_ani
	dw gfx_chapter3_ani
	dw gfx_chapter4_ani
	dw gfx_chapter5_ani
ani_chapter_bank:
	dw gfx_chapter1_ani>>16
	dw gfx_chapter2_ani>>16
	dw gfx_chapter3_ani>>16
	dw gfx_chapter4_ani>>16
	dw gfx_chapter5_ani>>16

//Game Over Screen ($1497BC - SNES CPU) (MX flags set)
//$1496F6 - SNES CPU - Set Tile Map
//Notes:
//$33C8 - VRAM Address (Word)
//$33CA - Full Address to DMA From
//$33CD - Size (bytes)
//$FE - Amount of frames left before next screen (from 0x00)
//$E6 - Current Char (*2)
//$2F - do +1 when changing Gameplay mode?
//$2A - Frame Counter
//JSL $00FC35 (Play SFX, use 0x2C)
//From 7F2190 and 7F21BC
enqueue pc
seekAddr($149731)
	jml asm_gameover_screen_setup
seekAddr($1497BC)
	jsl asm_gameover_screen_loop
	rts
dequeue pc
asm_gameover_screen_setup:
	phx
	phy
//"...Swooned..."
	ldx.w #0
	ldy.w #8
	lda.w #$3000
-;	sta $7F2190,x
	inc
	inc
	bit.w #$0010
	beq +
	clc
	adc.w #$0010
+;	inx
	inx
	dey
	bne -
//"Let's try this again!"
	ldx.w #0
	ldy.w #16

-;	sta $7F21D0,x
	inc
	inc
	bit.w #$0010
	beq +
	clc
	adc.w #$0010
+;	inx
	inx
	dey
	bne -

	ply
	plx
//original code
	plb
	plb
	lda.w #$7000
	jml $149736

asm_gameover_screen_loop:
	lda $E6
	cmp.b #(gfx_swooned_ani_frames*2)
	beq asm_gameover_screen_end
	lda $2A
	and.b #$07
	bne +
	lda.b #$40
	sta $FE

	//VRAM DMA Setup
	rep #$20
	lda.w #$C000/2
	sta $33C8
	clc
	lda $E6
	adc $E6
	adc $E6
	xba
	adc.w #gfx_swooned_ani
	sta $33CA
	lda.w #(gfx_swooned_ani >> 16)
	sta $33CC
	lda.w #$0600
	sta $33CD
	//Play SFX
	sep #$20
	lda.b #$2C
	jsl $00FC35

	inc $E6
	inc $E6
+;	clc; rtl
asm_gameover_screen_end:
	dec $FE
	bne +
	inc $2F
+;	clc; rtl

constant gfx_swooned_ani_frames = gfx_swooned_ani.size / 0x600

//Final Score Screen
//$14D198 (SNES CPU) -	Set up next
//$14D2D0 (SNES CPU) -	Sends CMD 0x40 (renders the text in full)
//						Uploads Tilemap to VRAM
//$14D356 (SNES CPU) - Upload Tile Text
//$9FE66E (SA-1 CPU) - CMD 0x40
//Use CMD 0x3A to render text char by char
//Or call $9FDDA1 for this (same thing as above), then do 40AE02 = FFFF, 33BC = 0000
//$33BC - VRAM Address (Word)
//$33BE - Full Address to DMA From (This gives the $409000 address)
//$33C2 - Size (bytes)

//$33C8 - VRAM Address (Word)
//$33CA - Full Address to DMA From
//$33CD - Size (bytes)
enqueue pc
seekAddr($14D1B8)
	jsl copy_final_score_stuff
seekAddr($14D2D4)
	nop; nop;
	nop; nop; nop; nop;
seekAddr($14D356)
	dec $fe
	beq ++
	lda $2142
	cmp.b #$15
	bne +
	stz $2142
+;	rtl
	//Update Char
+;	lda.b #$08
	sta $fe

	//Check for sound
	jsl space_check_sound
	bcc +
	lda.b #$15		//Play SFX
	sta $2142

+;	sep #$30

	//Render Char
	lda.b #$3A
	jsl $7EDCEB

	//Cancel DMA just to make sure
	rep #$30
	lda.w #0
	sta $33BC
	dec
	sta $40AE02

	//Set up proper DMA
	lda.w #$8000/2
	sta $33C8
	lda.w #$9000
	sta $33CA
	lda.w #$0040
	sta $33CC
	lda.w #$1600
	sta $33CD

	//Check if finished
	ldx {charoffset_w}
	lda {charbuffer},x
	cmp.w #$326D	//Delay
	beq ++
	and.w #$00FF
	cmp.w #$0075	//Delay
	beq ++
	cmp.w #$0076	//Delay
	beq ++
	cmp.w #$0077	//End
	bne +
	inc $2F
	lda.w #$0080
	sta $fe
+;	sep #$30
	rtl
+;	lda.w #$0040
	sta $fe
	sep #$30
	rtl
dequeue pc

copy_final_score_stuff:
	//MX unset

	//Copy Buffer
	ldx {charoffset}
-;	lda {charbuffer},x
	sta {charbuffer}+0x200,x
	dex; dex
	bpl -

	//Point text renderer to copied buffer
	ldx.w #$0200
	stx {charoffset}
	stz {charcurrent}

	//Empty main buffer
	lda.w #0
	dex; dex;
-;	sta {charbuffer},x
	dex; dex;
	bpl -
	rtl
