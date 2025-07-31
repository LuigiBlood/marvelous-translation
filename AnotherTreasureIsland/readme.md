# Marvelous \~Another Treasure Island\~ Translation

Original Translation Project by tashi and DackR.
This project is aimed to improve the translation as well as making it easier to edit, it uses the original files from the project.

Currently being translated in English & French.

## Staff
- LuigiBlood - Project Leader & Code Hacking

- tashi - Original English Text
- DackR - English Text Editing, Graphics
- bluesun - Japanese to English Retranslation

- Lestat - French Graphics
- pinktagada - English to French Text Translation

- /dev/urandom - Font Design

Special Thanks:
- FuSoYa - For dealing with the compression
- terminator2k2
- NukeOTron

## Debugging
A Lua script for Mesen has been provided , which tells on screen which text ID is being managed, as well as recalculating the text pointers as they are generated at boot by the game. The recalculation works in a way that allows us to use save states across several versions of the ROM, making it a lot easier to do quick debugging of changes.

The `_play_*.bat` files included expect `Mesen.exe` at `./tools/Mesen`.

## Building
### Requirements
- bass (ARM9 fork): https://github.com/ARM9/bass
  - Must be in `./tools/bass`.
  - Tested with bass v18
- Lunar Compress: http://fusoya.eludevisibility.org/lc/index.html
  - Must be in `./tools/lc`.
  - Tested with Lunar Compress 1.90
- SuperFamiconv: https://github.com/Optiroc/SuperFamiconv
  - Must be in `./tools/conv`.
- TransPutt and PuttScript
  - Must be in `./tools/putt`.
  - Must contain `marvelous` folder
- Put the original ROM as `./roms/Marvelous_JP.sfc`

### Command Order
For several reasons, I have opted to seperate the build process in several steps, as changes don't always need to pass through every step.  
You can replace `**` with either `en` (English) or `fr` (French).

- `_jp_extract.bat` 
  - **DO IT FIRST!** Extracts and decompresses every compressed data from the original ROM with Lunar Compress.
  - The build process uses those files as a base. You only need to do it once.
- `_**_0build_gfx.cmd` 
  - Converts PNG images into SNES format and inserts them into files.
  - If you have made graphical changes, do this step.
- `_**_0build_script.cmd` 
  - Copies script files from TransPutt and builds script binaries.
  - If you have made text changes, do this step.
- `_**_1lz.bat`
  - Compresses graphics with Lunar Compress.
  - If you have made graphical changes, do this step.
- `_**_2build.bat`
  - Build the ROM.
- `_**_2build_pal.bat`
  - Build the ROM with PAL conversion code.
