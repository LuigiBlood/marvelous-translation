//Build Marvelous ~Another Treasure Island~ English
architecture snes.cpu

include "./asm/macros.asm"

output "./roms/Marvelous_EN_LB.sfc", create
seekFile(0)
fill $400000,$FF	//Extend to 4MB
seekFile(0)
insert "./roms/Marvelous_JP.sfc"

include "./asm/code.asm"
include "./asm/insert_en.asm"
include "./asm/pointers.asm"
include "./asm/vwf.asm"

//Header
seekFile(0x7FB0)
db "01"		//Nintendo
db "AVRE"	//Game Code
db $00, $00, $00, $00, $00, $00
db $00		//Expansion FLASH
db $00		//Expansion RAM
db $00		//Special Version
db $00
db "MARVELOUS ENG FAN    "
db $23		//SuperMMC
db $35		//ROM+SA1+RAM+Battery
db $0C		//4MB ROM
db $06		//64KB RAM
db $01		//North America
db $33
db $20		//2.0