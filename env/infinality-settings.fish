###          freetype2-infinality-ultimate settings          ###
###           rev. 0.4.7.4, for freetype2 v.2.5.x            ###
###                                                          ###
###                Copyright (c) 2014 bohoomil               ###
### The MIT License (MIT) http://opensource.org/licenses/MIT ###
###      part of infinality-bundle  http://bohoomil.com      ###


echo "
Xft.antialias:  1
Xft.autohint:   0
Xft.dpi:        96
Xft.hinting:    1
Xft.hintstyle:  hintfull
Xft.lcdfilter:  lcddefault
Xft.rgba:       rgb
" | xrdb -merge > /dev/null 2>&1

### Available styles:
### 1 <> ultimate (default)
### 2 <> well balanced
### 3 <> darker & smoother #1 (OS X-like)
### 4 <> darker & smoother #2

set USE_STYLE "3"

if [ "$USE_STYLE" = "1" ]
	set -gx INFINALITY_FT_FILTER_PARAMS "07 24 35 24 07"
else if [ "$USE_STYLE" = "2" ]
	set -gx INFINALITY_FT_FILTER_PARAMS "11 26 33 26 11"
else if [ "$USE_STYLE" = "3" ]
	set -gx INFINALITY_FT_FILTER_PARAMS "13 26 39 26 13"
else if [ "$USE_STYLE" = "4" ]
	set -gx INFINALITY_FT_FILTER_PARAMS "14 28 42 28 14"
end

set -gx INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH "0"
set -gx INFINALITY_FT_FRINGE_FILTER_STRENGTH "0"
set -gx INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH "0"
set -gx INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH "0"
set -gx INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH "30"
set -gx INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH "0"
set -gx INFINALITY_FT_STEM_ALIGNMENT_STRENGTH "0"
set -gx INFINALITY_FT_STEM_FITTING_STRENGTH "0"
set -gx INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE "0"
set -gx INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT "0"
set -gx INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS "false"
set -gx INFINALITY_FT_GAMMA_CORRECTION "15 90"
set -gx INFINALITY_FT_BRIGHTNESS "0"
set -gx INFINALITY_FT_CONTRAST "0"
set -gx INFINALITY_FT_USE_VARIOUS_TWEAKS "true"
set -gx INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS "true"
set -gx INFINALITY_FT_GLOBAL_EMBOLDEN_X_VALUE "0"
set -gx INFINALITY_FT_GLOBAL_EMBOLDEN_Y_VALUE "0"
set -gx INFINALITY_FT_BOLD_EMBOLDEN_X_VALUE "0"
set -gx INFINALITY_FT_BOLD_EMBOLDEN_Y_VALUE "0"
