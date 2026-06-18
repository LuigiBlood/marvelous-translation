//==============================================================================================
// 3-LINE NOTIFICATION EVENT BOX ---- yet another hack for "Marvelous: Another Treasure Island"
//==============================================================================================
// DackR was here. 2026/06/17
//
// The game's message box for "notifications" normally shows 2 lines of text, and
// discards the third . This hack makes it show an additional line-- and be happy about it.
// In order to do this, three things have to change, and each one is its own
// little section:
//
// First- Make the HDMA'd window taller (make way for a 3rd line).
// Second- Draw the a 3rd row of text inside of the window.
// Third- Restore the graphics tiles that the 3rd line overwrote.

//=============================================================================
// Step 1: make the message box taller (room for the 3rd line)
//=============================================================================
// The game uses the PPU window feature plus HDMA: on every scan-line from top to
// bottom of the screen, it feeds a left/right pair that defines the
// location of the window. The per-line reveal draws the rectangle.
//
// The animation counter ($3033) ticks from 0 up to $14 over about
// 10 frames as the box opens. The fill routines draw a span of (counter x 2)
// per step, so when the counter reaches its top ($14) the box is ~2 lines tall.
//
// There were problems when I tried to let the counter climb higher than $14 so the
// box would grow taller. The counter is on a fixed timer, and forcing it
// past $14 sent the close anim down the open path and froze the game.
//
// We leave the counter 100% like the original, and change the math so each step
// draws (counter x3) instead of (counter x2). At the normal top ($14) the box
// is now 3 lines tall. The x3 math doesn't fit in the original spot, so it lives
// in two little code caves (cave_open / cave_close) further down...
enqueue pc

//--- The window open animation: send the height math out to our cave -------------------
// The original 5 bytes here did the "counter x 2" height calc:
//   A5 33   LDA $33     ; load the counter
//   0A      ASL         ; x2
//   85 00   STA $00     ; store the height
// We replace them with a jump to cave_open (which does x3 instead), padded with
// one NOP so we overwrite only ythe 5 bytes and don't disturb what
// follows. The game has already switched to 16-bit math just before this point,
// which cave_open is mindful of (because it's sentient now, jk).
seekAddr($9EF0AE)
	jsl cave_open		//jump out to our x3 height routine, then come back
	nop			//padding so we replace exactly the original 5 bytes

//--- shape the top half of the box, and hopefully make it 5 pixels taller ----------
// These tweak the top half of the rectangle so the 3 rows of text sit
// happily inside it. (cave_open feeds them the slightly-bigger upward value.)
seekAddr($9EF0C4)
	db $46			//was $3C: how far up to fill
seekAddr($9EF0C8)
	db $02			//was $00: subtract the value cave_open made
seekAddr($9EF0CC)
	db $46			//was $3C: matching loop count for the upward fill
seekAddr($9EF0D2)
	db $36			//was $54: the topmost scan-line of the box (line 155)

//--- the close animation: send its height math over to our cozy code cave --------------
// The original 9 bytes did the closing "(counter - $14) x 2" shrink calc (traced):
//   A5 33      LDA $33
//   38         SEC
//   E9 14 00   SBC #$0014
//   0A         ASL
//   85 00      STA $00
// Replaced with a jump to cave_close (does x3), padded with five NOPs to cover
// all 9 original bytes.
seekAddr($9EF105)
	jsl cave_close		//jump out to our x3 closing routine, then come back
	nop			//five nop bytes to fill the rest of the
	nop			//original 9-byte instruction sequence
	nop
	nop
	nop
seekAddr($9EF113)
	db $36			//was $54: closing top-edge scan-line (155, matches open)
seekAddr($9EF11D)
	db $3C			//bottom-half fill distance for closing (unchanged: 2 lines)
seekAddr($9EF125)
	db $3C			//matching loop count for that fill

//--- tell the mid-screen interrupt where the box's top is now ---------------
// A separat e timer fires partway down the screen to switch graphics settings
// right at the box's top egde. Since the box top moved up to line 155, point
// that timer at line ~156.
seekAddr($009CB8)
	db $9C			//was $A1: the scan-line where the box top begins
dequeue pc

//--- the two height-math code caves (in empty ROM at $F6:12xx) ---------------
// cave_open: works out the box height for the opening animation.
// It is entered with 16-bit register math already on. "$33" here means the counter $3033,
// "$00"/"$02" mean memory $3000/$3002, because of how memory is addressed at this
// moment. We write the bottom-half height to $3000 and a slightly taller top-half
// height to $3002.
enqueue pc
seekAddr($F61200)
cave_open:
	lda.b $33		//load the animation counter
	asl			//multiply it by 2...
	clc           // (i wish i was a little bit taller, i wish i was a baller)
	adc.b $33		//...then add it once more = counter x 3
	sta.b $00		//store that as the box's lower-half height ($3000)
	clc
	adc.w #$000A		//add 10 more (makes the top edge 5 pixels higher)
	sta.b $02		//store that as the box's upper-half height ($3002)
	rtl			//return to the game

//cave_close: same idea for the vlose animation. As the box shuts, the counter
//counts back down from $14, so we use (counter - $14) x 3 to shrink it smooth.
seekAddr($F61210)
cave_close:
	lda.b $33		//load the animation counter
	sec
	sbc.w #$0014		//subtract $14 -> how far into the close we are
	sta.b $00		//keep that number for a moment
	asl			//multiply it by 2...
	clc
	adc.b $00		//...then add it once more = (counter - $14) x 3
	sta.b $00		//store as the shrinking box height
	rtl			//return to the game
dequeue pc


//=============================================================================
// Step 2, part A: give the box a tilemap that includes a 3rd row of text
//=============================================================================
// The box's params (ie- its tilemap) is copied fresh every time the box
// opens, by a small loop inside the SA-1's code at $9FDC35. The layout
//  it copies normally has 4-ish "rows": top, line 1, line 2, bottom.
// We need a 5th row (gives space for text line 3) added in the middle.
//
// We can't make the existing layout bigger where it sits, because other SA-1
// code sits right after it. We write a brand-new 5-row layout into empty ROM
// space (from what I saw) at $F6:1000 and re-point the copy loop at it.
//
// The original instructions the loop uses:
//   A9 9F 00   LDA #$009F    ; the layout lives in ROM "bank" $9F
//   A2 04 01   LDX #$0104    ; copy this many bytes (the old 4-row layout)
//   BD 5F DC   LDA $DC5F,X   ; read the layout from address $DC5F
// We change  three operand bytes below... the bank, the byte-count, and s the address.
enqueue pc
seekAddr($9FDC37)
	db $F6			//was $9F- read the layout from ROM bank $F6 (our new copy)
seekAddr($9FDC3C)
	db $44			//was $04- copy $0144 bytes now (5 rows instead of 4)
seekAddr($9FDC3F)
	db $00,$10		//was $DC5F- read it from address $1000 (-> $F6:1000)
dequeue pc
// Voila! patched like a pair of old jeans

//--- our new 5-row box definition, lives in empty ROM at $F6:1000 ---------------
// Each entry is one 16x16 cell. $2260 is the plain box-background tile. The other
// numbers point at the text tiles the as-1 fills in with the .letters.
// The two values at the very top are a little header the copy loop expects:
// where in VRAM to put this data, and how many bytes it is.
enqueue pc
seekAddr($F61000)
	dw $7A80	//header- put this at VRAM address $7A80 (one row higher
			//than before, because the box now expands up by a row)
	dw $0140	//header- size = $140 bytes. MUST match the data length below,
			//or the copy loop loses its place and the game crashes.
	//row 0 - top border (all background tiles)
	dw $2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260
	//row 1 - text line 1 (the $21xx values are this line's letter tiles)
	dw $2260,$2260,$2260,$2260,$2140,$2142,$2144,$2146,$2148,$214A,$214C,$214E,$2160,$2162,$2164,$2166,$2168,$216A,$216C,$216E,$2180,$2182,$2184,$2186,$2188,$218A,$218C,$218E,$2260,$2260,$2260,$2260
	//row 2 - text line 2
	dw $2260,$2260,$2260,$2260,$21A0,$21A2,$21A4,$21A6,$21A8,$21AA,$21AC,$21AE,$21C0,$21C2,$21C4,$21C6,$21C8,$21CA,$21CC,$21CE,$21E0,$21E2,$21E4,$21E6,$21E8,$21EA,$21EC,$21EE,$2260,$2260,$2260,$2260
	//row 3 - text line 3  <-- THE NEW
	dw $2260,$2260,$2260,$2260,$2200,$2202,$2204,$2206,$2208,$220A,$220C,$220E,$2220,$2222,$2224,$2226,$2228,$222A,$222C,$222E,$2240,$2242,$2244,$2246,$2248,$224A,$224C,$224E,$2260,$2260,$2260,$2260
	//row 4 - bottom border
	dw $2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260,$2260
	// FFFF marker tells the copy loop it is finished
	dw $FFFF
dequeue pc


//=============================================================================
// Step 2, part B: copy the 3rd line's text/rendered glyphs into video memory
//=============================================================================
// When the box opens, the game does a bulk copy (DMA) of the rendered letters
// into VRAM. Both code paths that do this copy were set to move $0C00 bytes,
// which is only enough for line 1 and line 2 and then stop. So line 3's area
// of VRAM was never written and showed leftover garbage-- not really garbage
// since it is used elsewhere, but for our purposes
//
// We bump the copy size from $0C00 to $1200 bytes, so the copy now
// reaches through line 3 as well. Each instruction is "LDA #$0C00" (bytes
// A9 00 0C). we only change the high byte of the number, from $0C to $12.
enqueue pc
seekAddr($9FDFAE)
	db $12			//was $0C: copy size $1200 now (covers line 3) - path 1
seekAddr($9FE5DC)
	db $12			//was $0C: copy size $1200 now (covers line 3) - path 2
dequeue pc

//--- bugfix: the special render setup (button icons / [num] / amounts) -----
// When a box contains a special glyph (FE 6D xx -- button icons, the red number,
// etc.) the sa-1 runs another copy of the box-draw setup at $9FE3B0. That setup
// re-initializes BOTH the text-copy size AND the box tilemap's VRAM target with
// the original 2-line constants, overwriting previously drawn text and popping the
// text back to the original 2-line position.
//   $9FE3C2  LDA #$0C00  STA $33C2    <- copy size: only 2 lines of glyphs reach VRAM
//   $9FE3C8  LDA #$7AA0  STA $40AE02  <- tilemap target: the old position
// Patch the two immediates here like the other paths.
enqueue pc
seekAddr($9FE3C4)
	db $12			//was $0C: copy size $1200 now (covers line 3) - path 3 (special-glyph render)
seekAddr($9FE3C9)
	db $80			//was $A0: box tilemap VRAM target $7A80 (3-line row), was $7AA0 (2-line)
dequeue pc


//=============================================================================
// Step 2, part C: blank the existing vram for line-3 before drawing to it
//=============================================================================
// Before drawing text, the game wipes the letter temp area blank. Its wipe
// loop only clears up to where line 2 used to end, so the right-most few tiles of
// our new line 3 kept showing garbage. The loop counts using an 8-bit
// number, so it can't reach far enough just by changing the value (poop again).
//
// Instead we hook the start of that wipe loop and send it to cave_clear, which
// does one clean wipe over the entire text area (including line 3), it then jumps
// back into the game right after the old loop. The old loop is left in place
// but is now skipped over... dead code that we may want to blank, but not now (i'm lazy).
enqueue pc
seekAddr($9FE55A)
	jml cave_clear		//replace the wipe loop's start with a jump to our wipe
dequeue pc

//cave_clear: blank the staging area, then return to the game.
// It writes the blank value $00FF across every tile of used for the text box
// ($40:9000 to $40:A0FE) and then jumps back to where the original code
// continues ($9FE5C3).
enqueue pc
seekAddr($F61230)
cave_clear:
	rep #$30		//switch to 16-bit math (so we can wipe 2 bytes at a time)
	ldx.w #$11FE		//start at the far end of the temp space and count down
	lda.w #$00FF		//$00FF = one blank tile
-;	sta.w $9000,x		//write blank to temp space+X (bank $40)
	dex
	dex			//step back 2 bytes (one tile) ...
	bpl -			//...and keep going until we've wiped it all (the "-" is a lazy label we branch back to)
	sep #$10		//put the index size back to 8-bit, as the game expects
	jml $9FE5C3		//jump back into the game's normal flow
dequeue pc


//=============================================================================
// Step 3: put the menu's graphics back after we hijacked and overwrote them
//=============================================================================
// The line 3 of the box gets drawn into a stretch of VRAM that another menu
// menu (Walkie-Talkie, and item menu chrome/ui) also uses for its own.
// The game loads that menu's graphics once and assumes they stay put,
// so after a 3-line box appears, that menu shows up broken unless we
// restore what was there before we used it.
//
// I tried to back up the VRAM for line-3 into BWRAM, but it was too slow, caused flashing
// and corruption. Tried a few times before finally giving up. I tried to avoid this to save time...
// avoiding doing the RE to find the original DMA routine and ROM gfx location, but it ended up taking more time. :p
//
// So... we hook the routine the game runs every frame during VBlank/NMI,
// at $00BDE1. The cave_vram watches the box state and, on one frame
// the box finishes closing, copies the previous menu graphics from ROM back into VRAM.
//
// The original 5 bytes there set up the hardware addressing:
//   A2 00 43   LDX #$4300
//   DA         PHX
//   2B         PLD
// cave_vram redoes that, then adds the new shtuff.
enqueue pc
seekAddr($00BDE1)
	jsl cave_vram		//run our box/window-watcher every frame, then continue
	nop			//padding to replace the original 5 bytes
dequeue pc

//cave_vram: each frame, decide whether the menu graphics need restoring.
enqueue pc
seekAddr($F61250)
cave_vram:
	ldx.w #$4300		//redo the original hardware-address setup we replaced
	phx
	pld
	sep #$20		//switch to 8-bit math for the simple checks below
	lda.w $33BD		//where is the current copy aimed? (high byte)
	cmp.b #$6A		//$6A means the box is drawing rn
	beq cave_vram_setflag	// ..... remember the gfx will need restoring
	lda.w $3033		//otherwise, is the box still open/animating? (counter)
	bne cave_vram_done	//   yes -> nothing to do yet
	lda.l $40C600		//box is fully closed. is the "restore" flag set?
	beq cave_vram_done	//   no ->> nothing to do
	jsr cave_vram_restore	//   yes -> copy the graphics back from ROM
	lda.b #$00
	sta.l $40C600		//clear the flag so we don't restore again next frame
	bra cave_vram_done
cave_vram_setflag:
	lda.l $40C600		//is the flag already set?
	bne cave_vram_done	//   yes -> leave it. nothing more to do
	lda.b #$01
	sta.l $40C600		//   no  -> set it. restore the menu once the box closes
cave_vram_done:
	rtl			//return to the game's per-frame routine

//cave_vram_restore: the ROM-to-VRAM copy that fixes the menu.
// The previous graphics are in the ROM at $E6:9800 ($600 bytes). We set up a bulk copy (DMA) that
// reads from there and writes into VRam at the menu data's original addr ($E000), then start it.
// Use copy channel 4, which nothing else is using at the moment (I think).
cave_vram_restore:
	lda.b #$80
	sta.w $2115		//tell VRAM to auto-advance one word per write
	ldx.w #$7000
	stx.w $2116		//set the VRAM destination (address $E000/$7000, the menu area)
	ldx.w #$1801		//copy mode: read RAM/ROM -> write to the VRAM data port
	stx.b $40		//   (configure copy channel 4)
	ldx.w #$9800
	stx.b $42		//source address low: $9800
	lda.b #$E6
	sta.b $44		//source bank: $E6  -> ROM $E6:9800 = the menu graphics
	ldx.w #$0600
	stx.b $45		//how many bytes to copy: $600
	lda.b #$10
	sta.w $420B		//Go, go, power rangers: run the copy on channel 4
	rts			//done - back to cave_vram
dequeue pc
