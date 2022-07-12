//VWF Hack - WRAM
enqueue pc
//-Regular Chars
seekAddr($989F8F)	//Left Half of Char
	jsl vwf_setup_l
	nop
seekAddr($989FC1)	//Right Half of Char
	ldx {charoffset}
	jsl vwf_setup_r
	nop; nop; nop; nop; nop
	nop; nop; nop; nop; nop; nop; nop
seekAddr($989FF2)	
	jsl vwf_next
//-Kanji Chars
seekAddr($98A025)	//Right Half of Char
	ldx {charoffset}
	jsl vwf_setup_r
	nop; nop; nop; nop; nop
seekAddr($98A053)
	jsl vwf_next
dequeue pc

enqueue pc
seekAddr($98A05A)
//--VWF Rendering
	lda.w #$0007
	sta $0F
	-;
	//Upper Tile
	lda [$04],y
	jsl render_vwf_wram1

	//Lower Tile
	lda [$08],y
	jsl render_vwf_wram2

	inx
	inx
	iny
	iny
	dec $0F
	bpl -
	rts
//bound_check($0073BA)
dequeue pc

render_vwf_wram1:
	pea $0000
	jsl render_vwf_wram_manage
	pla
	rtl
render_vwf_wram2:
	pea $0100
	jsl render_vwf_wram_manage
	pla
	rtl

render_vwf_wram_manage:
			//$0E - Address (from 409000)
			//$0B - Return
	phy		//$09
	phx		//$07
	pha		//$05
	pha		//$03
	pha		//$01

	sta $0C

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

	jsr render_vwf_main_wram

	pla
	pla
	pla
	plx
	ply
	rtl

//--Render Half Char
render_vwf_main_wram:
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

	lda $7F0000,x
	and $0C
	xba
	lda $7F0001,x
	and $0C
	xba

	rep #$20

	ora $07-2,s
	sta $7F0000,x
	bra ++

+;	plx
	lda $07-2,s
	sta $7F0000,x

+;	plx
	sep #$20
	lda $09-4,s
	and $0C
	sta $09-4,s
	lda $0A-4,s
	and $0C
	sta $0A-4,s

	lda $7F0010,x
	and $0D
	xba
	lda $7F0011,x
	and $0D
	xba
	rep #$20

	ora $09-4,s
	sta $7F0010,x

	rts
