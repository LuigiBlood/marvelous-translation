//Build Marvelous ~Another Treasure Island~ English
architecture snes.cpu

include "./asm/macros.asm"

output "./roms/Marvelous_FR_LB_PAL.sfc", create
seekFile(0)
fill $400000,$FF	//Extend to 4MB
seekFile(0)
insert "./roms/Marvelous_JP.sfc"

include "./asm/insert_fr.asm"
include "./asm/txt/txt_vwf.asm"
include "./asm/txt/txt_code.asm"
include "./asm/txt/txt_halfchar.asm"
include "./asm/txt/txt_events.asm"
include "./asm/txt/txt_sound.asm"
include "./asm/code.asm"
include "./asm/pointers.asm"
include "./asm/pal.asm"

//Header
seekFile(0x7FB0)
db "01"		//Nintendo
db "AVRF"	//Game Code
db $00, $00, $00, $00, $00, $00
db $00		//Expansion FLASH
db $00		//Expansion RAM
db $00		//Special Version
db $00
db "MARVELOUS FRA FAN PAL"
db $23		//SuperMMC
db $35		//ROM+SA1+RAM+Battery
db $0C		//4MB ROM
db $06		//64KB RAM
db $02		//North America
db $33
db $20		//2.0
