//VWF Hack - Small Mode
//Fixes specific to Small Mode text
enqueue pc
seekAddr($9FDF28)	//Space Fix - Let VWF code deal with spaces
	nop
	nop
dequeue pc

enqueue pc
seekAddr($9FDDD2)
	jsl vwf_check_search
seekAddr($9FE53F)
	jsl vwf_check_search
seekAddr($9FE698)	//Final Screen
	jsl vwf_check_search
dequeue pc

enqueue pc
//-Regular Chars
seekAddr($9FDF1B)	//Left Half of Char
	jsl vwf_setup_s_l
seekAddr($9FDF6D)	//Right Half of Char
	ldx {charoffset}
	jsl vwf_setup_r
	nop; nop; nop; nop; nop
seekAddr($9FDF94)
	jsl vwf_next
//-Kanji Chars
seekAddr($9FDFE0)	//Right Half of Char
	ldx {charoffset}
	jsl vwf_setup_r
	nop; nop; nop; nop; nop
seekAddr($9FE00B)
	jsl vwf_next
dequeue pc

vwf_setup_s_l:
	jsl vwf_setup_l
	xba
	rtl

//VWF Hack - Team / Leader Name (Small Mode)
enqueue pc
seekAddr($9FE069)
	jsl setup_vwf_team

seekAddr($9FE09B)
	jsl setup_vwf_team3
seekAddr($9FE0B0)
	jsl next_vwf_team

seekAddr($9FE0F2)
	jsl setup_vwf_team3
seekAddr($9FE107)
	jsl next_vwf_team
dequeue pc

enqueue pc
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
dequeue pc

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
	sta $0C

	jmp render_vwf_generic_manage
