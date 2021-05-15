# Marvelous \~Another Treasure Island\~ Translation

Original Translation Project by tashi and DackR.
This project is aimed to improve the translation as well as making it easier to edit, it uses the original files from the project.

Current Team:
LuigiBlood
DackR
tashi

## You can build this by using:
- bass (ARM9 fork): https://github.com/ARM9/bass
  - Must be in `./tools/bass`.
- Lunar Compress: http://fusoya.eludevisibility.org/lc/index.html
  - Must be in `./tools/lc`.
- Put the original ROM as `./roms/Marvelous_JP.sfc`
- TransPutt and PuttScript
  - Must be in `./tools/putt`.
  - Must contain `marvelous` folder


## Command explanation:
- `_0build_en_script` 
  - Copies script files from TransPutt and builds script binaries.
- `_1lz_en.bat`
  - Compresses graphics with Lunar Compress
- `_2build_en.bat`
  - Build the ROM.
