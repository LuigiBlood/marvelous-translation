// VRAM Specific Macros
macro name_ch1() {
	db $FD, $C8, $FD, $C9, $FD, $CA, $FD, $CB, $FD, $CC, $FD, $CD, $FD, $CE, $FD, $CF
}
macro name_ch2() {
	db $FD, $D0, $FD, $D1, $FD, $D2, $FD, $D3, $FD, $D4, $FD, $D5, $FD, $D6, $FD, $D7
}
macro name_ch3() {
	db $FD, $D8, $FD, $D9, $FD, $DA, $FD, $DB, $FD, $DC, $FD, $DD, $FD, $DE, $FD, $DF
}
macro name_ch4() {
	db $FD, $E0, $FD, $E1, $FD, $E2, $FD, $E3, $FD, $E4, $FD, $E5, $FD, $E6, $FD, $E7
}
macro name_ch5() {
	db $FD, $E8, $FD, $E9, $FD, $EA, $FD, $EB, $FD, $EC, $FD, $ED, $FD, $EE, $FD, $EF
}

macro menu_start() {
	//Start from the (8)
	db $FD, $B0, $FD, $B1, $FD, $B2, $FD, $B3, $FD, $B4, $FD, $B5, $FD, $B6, $FD, $B7
}

macro menu_restart() {
	//Restart from the (9)
	db $FD, $F8, $FD, $F9, $FD, $FA, $FD, $FB, $FD, $FC, $FD, $B4, $FD, $B5, $FD, $B6, $FD, $B7
}

macro menu_start_fr() {
	//A partir d (5)
	db $FD, $B0, $FD, $B1, $FD, $B2, $FD, $B3, $FD, $B4
}

macro menu_save() {
	//Save&Quit
	db $FD, $C0, $FD, $C1, $FD, $C2, $FD, $C3, $FD, $C4, $FD, $C5, $FD, $C6, $FD, $C7
	db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0
}

//-----Main Menu & Save Select VRAM-----

db $FD, $90, $FD, $91, $FD, $92, $FD, $93
db $FD, $94, $FD, $95, $FD, $96, $FD, $97
db $FD, $98, $FD, $99, $FD, $9A
db $FD, $A0, $FD, $A1, $FD, $A2, $FD, $A3
db $FD, $A4, $FD, $A5, $FD, $A6, $FD, $A7
db $FD, $A8, $FD, $A9, $FD, $AA, $FD, $AB
db $FD, $AC, $FD, $AD
//Item
//db $50, $51, $62, $70
//Action
//db $57, $5B, $9E, $9F
//Check
//db $FC, $8E, $3F, $2A
//Button.
//db $90, $5F, $9F, $20, $F0
//Whistle Button
//db $6D, $51, $9B, $5C, $7A, $90, $5F, $9F, $F0
db $F0, $F0, $F0, $F0, $F0

//Unknown
db $33, $28, $04, $33, $2A, $09, $3B, $3C, $39, $35

//File Numbers
db $1F, $20, $21

//S.C. (Save Counter) 1
db $7A

//New Game
db $5D, $5E, $5F, $5C

//"No" (already in english)
db $0D, $36

//"Yes" (already in english) "Oui"
db $0E, $3C, $30

db $15, $0B, $12
db $01, $3A, $0C, $40, $4E, $2C, $00, $3D
db $12, $13, $00, $11, $F4, $03, $19, $49, $2A
db $FD, $21, $FD, $2B, $46
//S.C. (Save Counter) 2
db $7B
db $7D, $FD, $13, $2B, $4A
//Ch.
db $77
db $F0, $1F, $20, $21, $22, $23, $43
db $F0, $70, $71, $50, $51, $52, $0B, $11

//Must be empty - For Team names and save counts
db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0
db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0
db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0

//Chapter Names
name_ch1()
name_ch2()
name_ch3()
name_ch4()
name_ch5()

//Other
db $64, $65, $66, $67, $68, $69, $6A, $6B
db $8B, $8C, $8D, $8E, $8F, $90, $91, $92
db $93, $94, $95, $96, $97, $6D, $6E, $6F
db $53, $54, $55, $56, $98, $99, $9A, $9B

//Reached Limit of chars

db $FB	//End
//-----Alphabet-----
//Page 1
db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $F0, $1B, $1C, $1D, $1E, $1F
db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E, $3F
db $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
db $FB
//Page 2
db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $F0, $1B, $1C, $1D, $1E, $1F
db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E, $3F
db $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
db $FB
//Page 3
db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F
db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $F0, $1B, $1C, $1D, $1E, $1F
db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F
db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E, $3F
db $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F
db $FB

//-----Chapters VRAM-----
//Ch.
db $5B, $43
//12345 
db $1F, $20, $21, $22, $23
//
db $F0

//Names
name_ch1()
name_ch2()
name_ch3()
name_ch4()
name_ch5()


//Must be empty
db $F0

//Chapter
db $60, $61, $62, $63

db $F0, $F0, $F0, $F0, $F0, $F0, $F0
db $F0, $F0, $F0, $F0, $F0, $F0, $F0

db $FB

//-----Start from Select / Game Over VRAM-----
// 4, 4, 8, 16, 16, 16
//--Chapter 1 (Select)
//Ch. 1
db $43, $89, $8A, $1F
//t
db $F0, $F0, $F0, $F0
//Name
name_ch1()
//From Tent
menu_start_fr()
db $FD, $B5, $FD, $B6, $FD, $B7, $FD, $B8, $FD, $B9, $FD, $BA
db $F0, $F0, $F0, $F0, $F0
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//Save&Qui
menu_save()
db $FB

//-Chapter 2 (Select)
//Ch. 2
db $43, $89, $8A, $20
//t
db $F0, $F0, $F0, $F0
//Name
name_ch2()
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//From Mansion
menu_start_fr()
db $FC, $18, $FC, $19, $FC, $1A, $FC, $1B, $FC, $1C
db $F0, $F0, $F0, $F0, $F0, $F0
//Save&Qui
menu_save()
db $FB

//-Chapter 3 (Select)
//Ch. 3
db $43, $89, $8A, $21
//t
db $F0, $F0, $F0, $F0
//Name
name_ch3()
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//From Stable
menu_start_fr()
db $FC, $20, $FC, $21, $FC, $22, $FC, $23, $FC, $24, $FC, $25
db $F0, $F0, $F0, $F0, $F0
//Save&Qui
menu_save()
db $FB

//-Chapter 4 (Select)
//Ch. 4
db $43, $89, $8A, $22
//t
db $F0, $F0, $F0, $F0
//Name
name_ch4()
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//From Inn
menu_start_fr()
db $FC, $28, $FC, $29, $FC, $2A, $FC, $2B, $FC, $2C, $FC, $2D, $FC, $2E
db $F0, $F0, $F0, $F0
//Save&Qui
menu_save()
db $FB

//-Chapter 5 (Select)
//Ch. 5
db $43, $89, $8A, $23
//t
db $F0, $F0, $F0, $F0
//Name
name_ch5()
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//Save&Qui
menu_save()
db $FB

//-...Swooned... Try Again!
db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0
db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0
db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0

//db $FD, $F0, $FD, $F1, $FD, $F2, $FD, $F3, $FD, $F4, $FD, $F5, $FD, $F6, $FD, $F7, $F0, $F0

//db $FC, $00, $FC, $01, $FC, $02, $FC, $03, $FC, $04, $FC, $05, $FC, $06, $FC, $07, $FC, $08, $FC, $09
//db $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0

db $FB

//--Chapter 1 (Game Over)
//Ch. 1
db $43, $89, $8A, $1F
//t
db $F0, $F0, $F0, $F0
//Name
name_ch1()
//From Tent
menu_start_fr()
db $FD, $B5, $FD, $B6, $FD, $B7, $FD, $B8, $FD, $B9, $FD, $BA
db $F0, $F0, $F0, $F0, $F0
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//Save&Qui
menu_save()
db $FB

//--Chapter 2 (Game Over)
//Ch. 2
db $43, $89, $8A, $20
//t
db $F0, $F0, $F0, $F0
//Name
name_ch2()
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//From Mansion
menu_start_fr()
db $FC, $18, $FC, $19, $FC, $1A, $FC, $1B, $FC, $1C
db $F0, $F0, $F0, $F0, $F0, $F0
//Save&Qui
menu_save()
db $FB

//--Chapter 3 (Game Over)
//Ch. 3
db $43, $89, $8A, $21
//t
db $F0, $F0, $F0, $F0
//Name
name_ch3()
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//From Stable
menu_start_fr()
db $FC, $20, $FC, $21, $FC, $22, $FC, $23, $FC, $24, $FC, $25
db $F0, $F0, $F0, $F0, $F0
//Save&Qui
menu_save()
db $FB

//--Chapter 4 (Game Over)
//Ch. 4
db $43, $89, $8A, $22
//t
db $F0, $F0, $F0, $F0
//Name
name_ch4()
//From Ship
menu_start_fr()
db $FC, $10, $FC, $11, $FC, $12, $FC, $13, $FC, $14
db $F0, $F0, $F0, $F0, $F0, $F0
//From Inn
menu_start_fr()
db $FC, $28, $FC, $29, $FC, $2A, $FC, $2B, $FC, $2C, $FC, $2D, $FC, $2E
db $F0, $F0, $F0, $F0
//Save&Qui
menu_save()
db $FB

//--Chapter 5 (Game Over)
//Ch. 5
db $43, $89, $8A, $23
//t
db $F0, $F0, $F0, $F0
//Name
name_ch5()
//From Blue Door
menu_start_fr()
db $FC, $30, $FC, $31, $FC, $32, $FC, $33, $FC, $34, $FC, $35, $FC, $36, $FC, $37, $FC, $38
db $F0, $F0
//From Blue Door
menu_start_fr()
db $FC, $30, $FC, $31, $FC, $32, $FC, $33, $FC, $34, $FC, $35, $FC, $36, $FC, $37, $FC, $38
db $F0, $F0
//Save&Qui
menu_save()
db $FB
