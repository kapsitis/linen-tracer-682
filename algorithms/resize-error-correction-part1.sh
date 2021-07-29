#!/bin/bash

export SRCDIR="tale-error-correction-part1/Pictures"
export DSTDIR="tale-error-correction-part1"

convert $SRCDIR/error-correction.png -resize 400 $DSTDIR/error-correction.png
convert $SRCDIR/error-detection.png -resize 700 $DSTDIR/error-detection.png
convert $SRCDIR/repetition-code.png -resize 400 $DSTDIR/repetition-code.png
convert $SRCDIR/ethernet-frame.png -resize 600 $DSTDIR/ethernet-frame.png
convert $SRCDIR/hashtools-1.png -resize 400 $DSTDIR/hashtools-1.png

