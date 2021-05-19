//PAL Conversion
seekAddr($BF8000)

//Reduce Introduction Scrolling Speed
pushvar pc
seekAddr($9FFA69)
	//lda $76; cmp.w #$0004
	jsl pal_intro_scrolling; nop
pullvar pc

pal_intro_scrolling:
	phx
	lda $76
	ldx $35F0
	cpx.b #3
	bne +
	cmp.w #$0004
	bcc ++
	stz $35F0
	plx
	sec
	rtl

+;	cmp.w #$0003
	bcc +
	inc $35F0
	plx
	sec
	rtl
+;	clc
	plx
	rtl