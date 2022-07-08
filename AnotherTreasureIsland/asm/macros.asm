//Macros
arch snes.cpu

//Seek SA-1 Address
//Assumes the following
//00-1F (Lo) & C0-CF (Hi) - Bank 0 (0x000000)
//20-3F (Lo) & D0-DF (Hi) - Bank 1 (0x100000)
//80-9F (Lo) & E0-EF (Hi) - Bank 2 (0x200000)
//A0-BF (Lo) & F0-FF (Hi) - Bank 3 (0x300000)
macro seekAddr(n) {
  if {n} < 0xC00000 {
    origin (({n} & $800000) >> 2) | (({n} & $3F0000) >> 1) | ({n} & $7FFF)
  } else {
	origin ({n} & $3FFFFF)
  }
  base {n}
}

//Seek File Offset (SA-1 HiROM Base)
macro seekFile(n) {
  origin {n}
  base (({n} & $3FFFFF) | 0xC00000)
}

//Seek File Offset (SA-1 LoROM Base)
macro seekFileLo(n) {
  origin {n}
  base ((({n} & $200000) << 2) | (({n} & $1F8000) << 1) | ({n} & $7FFF))
}

//Convert Base from LoROM to HiROM area
macro setHiROMBase() {
  base ((origin() & $3FFFFF) | 0xC00000)
}

//Convert Base from HiROM to LoROM area
macro setLoROMBase() {
  base (((origin() & $200000) << 2) | ((origin() & $1F8000) << 1) | $8000 | (origin() & $7FFF))
}

//Skip Bank
macro skipBank() {
  if pc() < 0xC00000 {	//LoROM Area
    origin (origin() + (0x8000 - (origin() & 0xFFFF)))
	setLoROMBase()
  } else {				//HiROM Area
	origin (origin() + (0x10000 - (origin() & 0xFFFF)))
	setHiROMBase()
  }
}

//Get Bank, High, Low Address
macro DB_BANK(n) {
	db (({n} >> 16) & $FF)
}

macro DB_HI(n) {
	db (({n} >> 8) & $FF)
}

macro DB_LO(n) {
	db ({n} & $FF)
}

macro ptr_replace(id, n) {
	seekFile($0011E3 + {id})
	DB_BANK({n})
	seekFile($0012DC + {id})
	DB_HI({n})
	seekFile($0013D5 + {id})
	DB_LO({n})
}

macro bound_check(n) {
	if origin() > {n} {
		error "ERROR, OVERWRITING ANOTHER FILE"
	}
}

macro size_check(b, n) {
	if pc() > ({b} + {n}) {
		error "ERROR, OVERSIZED"
	}
}
