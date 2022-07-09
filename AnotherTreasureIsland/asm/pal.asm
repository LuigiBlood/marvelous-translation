//PAL Conversion
setLoROMBase()

//Increase Introduction Scrolling Speed
enqueue pc
seekAddr($9FFA69)
	//lda $76; cmp.w #$0004
	jsl pal_intro_scrolling; nop
seekAddr($9FFA70)
	//stz $76
	nop; nop
dequeue pc

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

//King Bull Dance Sync (Ch.1) ($05AF38 / $05AF77 / $05AFE0)
//Intro
enqueue pc
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
dequeue pc

//Indio Kidnapping Dance Sync (Ch.2)
//($09B968 - Turn Around - 1)
enqueue pc
seekAddr($09B968)
	lda.b #$25
//($09BD76 - Laugh Jingle)
seekAddr($09BD76)
	lda $6f58,x
	inc
	cmp.b #$0D
	sta $6f58,x
	db $90	//BCC
dequeue pc

//Jean & Ken Swap Dance Sync (Ch.3)
//Jean & Ken Rock Dance Sync (Ch.3)
//Team Victory Dance
enqueue pc
seekAddr($12B18A)	//Turn Around
	//lda.b #$05
	lda.b #$04
seekAddr($12B1A5)	//Victory Fist
	//lda.b #$10
	lda.b #$0F
dequeue pc

//Jack - Building Stairs (Ch.1)
//$129188 - Moving Around
//$1292E2 - Fumes Loop
//$12949C - Final?
enqueue pc
seekAddr($12906E)	//0x58 bytes
	//db $06, $14, $0E, $14, $0B, $14, $07, $14
	//db $06, $0F
	//db $07, $0F, $05, $0F, $07, $0F, $05, $0F
	//db $06, $0F, $04, $0F, $06, $0F
	//db $03, $0A, $05, $0A, $03, $0A, $05, $0A
	//db $02, $0A, $04, $0A, $02, $0A, $04, $0A
	//db $01, $05, $03, $05, $01, $05, $03, $05
	//db $01, $05, $02, $05, $01, $05, $02, $05, $01, $05, $02, $05, $01, $05, $02, $05
	//db $01, $05, $01, $05, $01, $05, $01, $05
	//db $01, $05, $01, $05, $01, $05, $01, $05
	//db $01, $05, $01, $05, $01, $05
	//db $02, $05

	db $06, $14, $0E, $14, $0B, $14, $07, $14
	db $06, $0F
	db $07, $0E, $05, $0E, $07, $0E, $05, $0E
	db $06, $0E, $04, $0E, $06, $0E
	db $03, $0A, $05, $0A, $03, $0A, $05, $0A
	db $02, $0A, $04, $0A, $02, $0A, $04, $0A
	db $01, $05, $03, $05, $01, $05, $03, $05
	db $01, $05, $02, $05, $01, $05, $02, $05, $01, $05, $02, $05, $01, $05, $02, $05
	db $01, $04, $01, $04, $01, $04, $01, $04
	db $01, $04, $01, $04, $01, $04, $01, $04
	db $01, $04, $01, $04, $01, $04
	db $02, $05
seekAddr($129200)	//Timing for moving
	//lda.b #$60
	lda.b #$30
dequeue pc

//Jack - Building Mr. Diggy (Ch.2)
