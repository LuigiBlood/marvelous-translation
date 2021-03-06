setLoROMBase()

//--Check for Spaces / Script ID for sounds
enqueue pc
seekAddr($9FBCF4)
	jsl space_check_sound_hack
seekAddr($9FDF37)
	jsl space_check_sound_hack
dequeue pc

space_check_sound_hack:
	jsl space_check_sound
	bcc +
	jsl $00FC1A
+;	rtl

space_check_sound:
	//If Carry set = Sound, if unset = No Sound
	pha
	phx
	php
	rep #$30

	//Check if it's a Script ID that doesn't need sound
	lda {scriptid}
	ldx.w #(script_check_sound_table_end-script_check_sound_table-2)

-;	cmp script_check_sound_table,x
	beq +
	dex
	dex
	bpl -

	//Check if the char being rendered is a space
	ldx {charoffset_w}
	lda {charbuffer},x
	ldx.w #(space_check_sound_table_end-space_check_sound_table-2)
	xba
	lsr

-;	cmp space_check_sound_table,x
	beq +
	dex
	dex
	bpl -

	//Make a sound
	plp
	plx
	pla
	sec
	rtl
	//Don't make a sound
+;	plp
	plx
	pla
	clc
	rtl
//Characters that shouldn't make a sound (spaces and others)
space_check_sound_table:
	dw $1A, $E0, $E1, $E2, $E3, $E4, $E5, $EF, $F0
space_check_sound_table_end:
//Script IDs (*3) that shouldn't make a sound entirely
script_check_sound_table:
	dw 39*3, 40*3
script_check_sound_table_end:
