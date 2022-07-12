setLoROMBase()
//VWF Hack - Make only one half for regular and kanji chars

//VRAM Font Upload Hack (Fixed Width only)
enqueue pc
seekAddr($98A025)
	ldx {charoffset}
	lda {charbuffer},x
	xba
	inc
	nop; nop; nop
seekAddr($989FC7)
	xba
	inc
	nop; nop; nop; nop; nop; nop; nop; nop; nop; nop
dequeue pc

//Do not use 4 bytes when filling the Virtual Tileset
enqueue pc
//VRAM Setup (Journal)
seekAddr($988ABF)
	nop; nop; nop; nop; nop; nop; nop; nop
seekAddr($988B36)
	nop; nop; nop; nop; nop; nop; nop; nop
//VRAM Setup (Journal - Save)
seekAddr($989CD0)
	nop; nop; nop; nop; nop; nop; nop; nop
seekAddr($989D47)
	nop; nop; nop; nop; nop; nop; nop; nop
//Team Name Entry
seekAddr($989107)
	nop; nop; nop; nop; nop; nop; nop
seekAddr($989110)
	nop; nop
dequeue pc

//Do not use 4 bytes when filling the Virtual Tileset
enqueue pc
//00-01
seekAddr($9FBA71)
	nop; nop; nop; nop; nop
seekAddr($9FBA81)
	nop; nop; nop; nop
seekAddr($9FBA8A)
	nop; nop
//02-03
seekAddr($9FBABA)
	nop; nop; nop; nop; nop
seekAddr($9FBACA)
	nop; nop; nop; nop
seekAddr($9FBAD3)
	nop; nop
//04-05
seekAddr($9FBAE4)
	nop; nop; nop; nop; nop
seekAddr($9FBAF4)
	nop; nop; nop; nop
seekAddr($9FBAFD)
	nop; nop
//06-07
seekAddr($9FBB0E)
	nop; nop; nop; nop; nop
seekAddr($9FBB1E)
	nop; nop; nop; nop
seekAddr($9FBB27)
	nop; nop
dequeue pc

//Half Char for Luck Rock Amount Fixes
enqueue pc
seekAddr($9FC072)
	nop; nop; nop; nop; nop
seekAddr($9FC07D)
	nop; nop; nop; nop

seekAddr($9FC0B8)
	nop; nop; nop; nop; nop
seekAddr($9FC0C3)
	nop; nop; nop; nop

seekAddr($9FC0FE)
	nop; nop; nop; nop; nop
seekAddr($9FC109)
	nop; nop; nop; nop

seekAddr($9FC125)
	nop; nop; nop; nop; nop
seekAddr($9FC130)
	nop; nop; nop; nop
dequeue pc
