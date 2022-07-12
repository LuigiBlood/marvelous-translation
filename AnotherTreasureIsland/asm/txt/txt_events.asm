setLoROMBase()

//Fix Stuck Events (Breakpoint $8CE327)
//-- Breakpoint $8CE304 - Event Set Script ID?
//-- Breakpoint $8CE32D - Event Check
enqueue pc
seekAddr($038DB9)	//SA-1 / Ch.3 - Town Manager and Lunch Box (Script ID: 203)
	jsl event_char_detection
	nop
	db $90	//BCC
seekAddr($039424)	//SA-1 / Ch.3 - Lunch Box to Husband (0x4AA / Script ID: 398)
					//This one is odd... It never triggers, and performs the same thing as the next one
					//Disable it to avoid conflicts
	rtl 
	//jsl event_char_detection
	//nop
	//db $90	//BCC
seekAddr($04E6BA)	//SNES / Ch.3 - Lunch Box to Husband (0x4AA / Script ID: 398)
					//Stop the Eating animation when he asks if you have the key
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($04F264)	//SNES / Ch.3 - Mike and Lunch Box (Script ID: 174)
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($04F2AA)	//SNES / Ch.3 - Mike and Forgotten Doll Choice (Script ID: 175)
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($06E9AC)	//SNES / Ch.3 - Boxing Man, after giving the coin (0x181B / Script ID: 2057)
					//When Laughing
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($06E9C4)	//SNES / Ch.3 - Boxing Man, after giving the coin (0x181B / Script ID: 2057)
					//After Laughing
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($07EB49)	//SNES / Ch.4 - When Polly tickles the bird at the start (0x474 - Script ID: 380)
					//63 - When she becomes angry at the second sentence
	jsl event2_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($07ED2C)	//SNES / Ch.4 - After the bird is gone, when Polly says not to worry (0x471 / Script ID: 379)
					//FF - After she says she brought 3 giants, she faces you
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($07EF2B)	//SNES / Ch.4 - When Polly tickles the bird at the start (0x474 - Script ID: 380)
					//62 - After she says "Not so easily!", this code is weird
					//She moves her glasses, has to be continuously called, must have [Event][np]
	jsl eventnp_char_detection
	nop; nop
	sep #$20
	db $B0	//BCS
seekAddr($13F938)	//SNES / Ch.3 - When the baby calms down after giving the doll (0x498 / Script ID: 392)
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
seekAddr($8FAE68)	//SNES / Ch.2 - When Ms. Sisko talks to the kids after getting the Crystal Ball [1CA4] (Script ID: 2444)
					//The moment when she talks about being concerned about your teacher
	jsl event_char_detection
	nop; nop
	db $90	//BCC
seekAddr($8FAE70)	//This part prevents an accidental trigger (when it's above 0x200), we can remove it
	nop; nop; nop
	nop; nop

seekAddr($8FAE87)	//SNES / Ch.2 - When Ms. Sisko talks to the kids after getting the Crystal Ball (Script ID: 2444)
					//The moment when she wonders if she has seen you before
	jsl event_char_detection
	nop; nop
	sep #$20
	db $90	//BCC
//seekAddr($99DB7C)	//SNES / Ch.4 - After the Boss, when Polly thanks you (0x1260 / Script ID: 1568)
					//???? THIS IS USELESS CODE, WTF, there wouldn't be a single change in the results
					//No change needed
	//jsl event_char_detection
	//nop; nop
	//sep #$20
	//db $90	//BCC
dequeue pc

event_char_detection:
	phx
	php
	rep #$30
	ldx {charoffset_w}		//Get Current Char
	lda {charbuffer},x
	xba
	cmp.w #$E4*2
	beq +
	plp
	plx
	clc
	rtl
+;	plp
	plx
	sec
	rtl

eventnp_char_detection:
	phx
	php
	rep #$30
	ldx {charoffset_w}		//Get Previous Char
	dex
	dex
	lda {charbuffer},x
	xba
	cmp.w #$E4*2
	beq +
	plp
	plx
	clc
	rtl
+;	plp
	plx
	sec
	rtl

event2_char_detection:
	phx
	php
	rep #$30
	ldx {charoffset_w}		//Get Current Char
	lda {charbuffer},x
	xba
	cmp.w #$E5*2
	beq +
	plp
	plx
	clc
	rtl
+;	plp
	plx
	sec
	rtl
