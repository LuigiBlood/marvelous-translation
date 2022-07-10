setLoROMBase()

//D = 3500, DB = 00
define itemkeep = $F4		//(Global) Keep Item

//Experimental Border Flickering Fix (when selecting an item)
//Actually sets color palette for faces
//seekAddr($009F5D)
//	lda.b #$00

//009F3C - Inventory Palette
//Very Hacky Fixes
enqueue pc
seekAddr($009F37)	//PC 0x1F39
	jsl itemselect_check1
	nop
	db $D0	//bne
	//--Original Code:
	//stz $00
	//lda $33ba
	//beq ($009F79)
//009FEB - Normal Palette
seekAddr($009FE6)	//PC 0x1FE6
	jsl itemselect_check2
	nop
	//--Original Code:
	//lda $4210
	//lda $47
	//bne ($009FF4)
dequeue pc

//-Search Mode Inventory Fix
itemselect_check1:
	stz $00
	lda $33BA
	beq itemselect_check_cmn
	lda.b #$00
	rtl

itemselect_check2:
	lda $4210
	lda $47
	beq +

itemselect_check_cmn:
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


//Avoid Rerendering Item Names all the time in Item Select mode
enqueue pc
seekAddr($9FB690)	//PC 0x2FB690
	jsl item_name_render_init
	//--Original Code:
	//lda $5c
	//cmp.b #$70
seekAddr($9FCE9B)
	jml item_name_render_stop
	//--Original Code:
	//lda $00F01A,x
dequeue pc

item_name_render_init:
	stz {itemkeep}
	lda $5C
	cmp.b #$70
	rtl

item_name_render_stop:
	lda $5A
	cmp {itemkeep}
	beq +
	sta {itemkeep}
	lda $00F01A,x
	jml $9FCE9F
+;	jml $9FCEA2
