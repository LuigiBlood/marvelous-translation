//VWF Hack - Search Mode
//Fixes specific to Search Mode text?
enqueue pc
seekAddr($9FC03F)	//Fix Limit
	db $90
	//bcc CODE_9FC02C
seekAddr($9FC02A)	//Fix Limit
	db $B0
	//bcs CODE_9FC041
seekAddr($9FBCD5)	//Space Fix - Let VWF code deal with spaces
	nop
	nop
dequeue pc

//Check Command
enqueue pc
seekAddr($97FD2C)	//SNES CPU - Text
	jsl vwf_check_search_l
	nop
	nop
seekAddr($9FB64E)	//SA-1 - Items
	jsl vwf_check_search
seekAddr($9FB6C9)	//SA-1 - Text
	jsl vwf_check_search
dequeue pc

vwf_check_search_l:
	jsl vwf_check_search
	jml $9FB68A

vwf_check_search:
	pha
	jsl vwf_check_char
	pla
	sep #$30
	asl
	tax
	rtl

enqueue pc
//-Regular Chars
seekAddr($9FBD00)	//Left Half of Char
	jsl vwf_setup_l
	nop; nop; nop
seekAddr($9FBD31)	//Right Half of Char
	ldx $9A
	jsl vwf_setup_r
	nop; nop; nop; nop; nop
seekAddr($9FBD58)
	jsl vwf_next
//-Kanji Chars
seekAddr($9FBDA4)	//Right Half of Char
	ldx $9A
	jsl vwf_setup_r
	nop; nop; nop; nop; nop
seekAddr($9FBDCF)
	jsl vwf_next
dequeue pc

vwf_setup_l:
	lda {charbuffer},x
	xba
	jsl vwf_setup
	rtl
vwf_setup_r:
	lda {charbuffer},x
	xba
	inc
	jsl vwf_setup
	rtl

//VWF Hack - Team / Leader Name (Search Mode)
enqueue pc
seekAddr($9FBDF2)
	jsl setup_vwf_team

seekAddr($9FBE24)
	jsl setup_vwf_team3
seekAddr($9FBE39)
	jsl next_vwf_team

seekAddr($9FBE7B)
	jsl setup_vwf_team3
seekAddr($9FBE90)
	jsl next_vwf_team
dequeue pc

setup_vwf_team:
	pha
	asl
	sta {charnext}
	jsl vwf_setup
	pla
	asl; asl; asl; asl
	rtl
setup_vwf_team3:
	pha
	lda {charnext}
	inc
	jsl vwf_setup
	pla
	clc
	adc.w #$0020
	rtl
next_vwf_team:
	jsl vwf_next
	dec $9A
	lda {charcurrent}
	rtl

//Rendering
enqueue pc
seekAddr($9FBF97)
//--Search Mode VWF Rendering
	ldy.w #$0000
	lda.w #$0007
	sta $0F
	-;
	//Upper Tile
	pea $0000
	lda [$04],y
	jsl vwf_render_search
	pla

	//Lower Tile
	pea $0100
	lda [$08],y
	jsl vwf_render_search
	pla

	inx
	inx
	iny
	iny
	dec $0F
	bpl -
	rts
bound_check($2FBFDB)
dequeue pc

vwf_render_search:
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
	sta $0C

	jmp render_vwf_generic_manage
