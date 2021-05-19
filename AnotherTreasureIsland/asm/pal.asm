//PAL Conversion
seekAddr($BF8000)

//Increase Introduction Scrolling Speed
pushvar pc
seekAddr($9FFA69)
	//lda $76; cmp.w #$0004
	jsl pal_intro_scrolling; nop
seekAddr($9FFA70)
	//stz $76
	nop; nop
pullvar pc

pal_intro_scrolling:
	lda $76
	cmp.w #$0003
	bcc +
	beq +
	cmp.w #$0006
	bcc +
	beq +
	cmp.w #$0009
	bcc +
	beq +
	cmp.w #$000D
	bcc +
	stz $76
+;	rtl

//King Bull Dance Sync ($05AF38 / $05AF77 / $05AFE0)
//Intro
seekAddr($05AE58)
	//db $10, $10, $10, $10, $08, $08, $08, $08, $08, $08, $14, $14, $14, $14, $14, $14, $14
	db 13, 13, 13, 13, 6, 6, 6, 6, 6, 6, 16, 16, 16, 16, 16, 16, 16
//Walking
seekAddr($05AE82)
	//db $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10
	//db $0c, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $32
	db 13, 13, 13, 14, 13, 13, 13, 14, 13, 13, 13, 14
	db 10,  3,  3,  3,  4,  3,  3,  3,  4,  3,  3,  3, 41
//Stop
seekAddr($05AEA1)
	//db $14, $14, $14, $14, $14, $14
	db 16, 16, 16, 16, 16, 16

//Indio Kidnapping Dance Sync
//Jean & Ken Dance Sync
