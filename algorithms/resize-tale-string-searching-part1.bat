set SRCDIR="tale-string-searching-part1/Pictures"
set DSTDIR="tale-string-searching-part1"

magick convert %SRCDIR%/abab-automaton.png -resize 440 %DSTDIR%/abab-automaton.png
magick convert %SRCDIR%/aabab-automaton.png -resize 500 %DSTDIR%/aabab-automaton.png

magick convert %SRCDIR%/prefix-functions1.png -resize 500 %DSTDIR%/prefix-functions1.png
magick convert %SRCDIR%/prefix-functions2.png -resize 500 %DSTDIR%/prefix-functions2.png


