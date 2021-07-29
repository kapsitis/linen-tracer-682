#!/bin/bash

export SRCDIR="tale-string-searching-part1/Pictures"
export DSTDIR="tale-string-searching-part1"

convert $SRCDIR/abab-automaton.png -resize 440 $DSTDIR/abab-automaton.png
convert $SRCDIR/aabab-automaton.png -resize 500 $DSTDIR/aabab-automaton.png

convert $SRCDIR/prefix-functions1.png -resize 500 $DSTDIR/prefix-functions1.png
convert $SRCDIR/prefix-functions2.png -resize 700 $DSTDIR/prefix-functions2.png
convert $SRCDIR/prefix-functions3.png -resize 700 $DSTDIR/prefix-functions3.png


