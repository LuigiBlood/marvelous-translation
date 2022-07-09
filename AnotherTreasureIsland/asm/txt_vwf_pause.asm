//VWF Hack - Item Name in Pause Menu
enqueue pc
seekAddr($00F2A1)
	cmp.w #$002E
	db $90

//-Regular Chars
seekAddr($00F2A9)	//Left Half of Char
	jsl vwf_setup_l
	nop
seekAddr($00F2DB)	//Right Half of Char
	ldx $9A
	jsl vwf_setup_r
	nop; nop; nop; nop; nop
seekAddr($00F305)	
	jsl vwf_next
	inc $9a
//-Kanji Chars
seekAddr($00F345)	//Right Half of Char
	ldx $9A
	jsl vwf_setup_r
	nop; nop; nop; nop; nop
	nop; nop; nop; nop; nop; nop; nop
seekAddr($00F37A)
	jsl vwf_next

dequeue pc

enqueue pc
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
dequeue pc

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

	sta $0C

	jmp render_vwf_generic_manage
