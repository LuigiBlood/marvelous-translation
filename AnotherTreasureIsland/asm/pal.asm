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
