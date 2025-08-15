function IsOriginalROM()
	local hash = emu.getRomInfo().fileSha1Hash

	if hash == "46FE42F195D43B71BA0608356EB7C2B65BFF70AC" then
		return true
	end
	return false
end

function RecalcScriptPointers()
	--$F00000
	--Special Bytecode:
	--F4 xx
	--F5 xxxx
	--FC xx
	--FD xx
	--FE xx
	--FE 6D xx
	--FA (End Text 1)
	--FB (End Text 2)
	--FF (END CALC)

	ptr = emu.read16(0x00FC83, emu.memType.snesMemory, false) | (emu.read16(0x00FC8C, emu.memType.snesMemory, false) << 16)
	emu.log("Text Data Script @ $" .. string.format("%06X", ptr))
	ptrWrite = 0x40DBE0
	emu.write32(ptrWrite, ptr, emu.memType.snesMemory)
	ptrWrite = ptrWrite + 3
	repeat
		bytecode = emu.read(ptr, emu.memType.snesMemory, false)
		if bytecode == 0xFA or bytecode == 0xFB then
			--write next pointer
			ptr = ptr + 1
			emu.write32(ptrWrite, ptr, emu.memType.snesMemory)
			ptrWrite = ptrWrite + 3
		elseif bytecode == 0xF4 or bytecode == 0xFC or bytecode == 0xFD then
			ptr = ptr + 2
		elseif bytecode == 0xFE then
			if emu.read(ptr + 1, emu.memType.snesMemory, false) == 0x6D then
				ptr = ptr + 3
			else
				ptr = ptr + 2
			end
		elseif bytecode == 0xF5 then
			ptr = ptr + 3
		else
			ptr = ptr + 1
		end
	until bytecode == 0xFF
	emu.log("Script Pointers Redone @ $40DBE0-$" .. string.format("%06X", ptrWrite))
	emu.displayMessage("[Script]", "Script Pointers Redone @ $40DBE0-$" .. string.format("%06X", ptrWrite))
end

function PrintScriptID()
	bgColor = 0x302060FF
    fgColor = 0x30FF4040
    
    id = emu.read16(0x5AA, emu.memType.sa1InternalRam, false) / 3
    if id > 0 then
		emu.drawRectangle(8, 15, 128, 15, bgColor, true, 1)
		emu.drawRectangle(8, 15, 128, 15, fgColor, false, 1)
		emu.drawString(12, 19, "Script ID: " .. math.floor(id), 0xFFFFFF, 0xFF000000)
	end
end

emu.selectDrawSurface(emu.drawSurface.scriptHud, 2)

--Debug Mode
emu.write(0x2F8000, 0x00, emu.memType.snesPrgRom)

emu.addEventCallback(PrintScriptID, emu.eventType.endFrame);
emu.addEventCallback(RecalcScriptPointers, emu.eventType.stateLoaded)
RecalcScriptPointers()
