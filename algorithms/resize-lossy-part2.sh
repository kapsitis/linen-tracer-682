#!/bin/bash

export SRCDIR="tale-algorithms-lossy-part2/Pictures"
export DSTDIR="tale-algorithms-lossy-part2"

convert $SRCDIR/embedding-watermark.png -resize 500 $DSTDIR/embedding-watermark.png
convert $SRCDIR/critical-bands.png -resize 400 $DSTDIR/critical-bands.png
convert $SRCDIR/equalizer-by-frequency.png -resize 400 $DSTDIR/equalizer-by-frequency.png
convert $SRCDIR/full-mp3-model.png -resize 400 $DSTDIR/full-mp3-model.png
convert $SRCDIR/masking-by-freq.png -resize 400 $DSTDIR/masking-by-freq.png
convert $SRCDIR/temporal-masking.png -resize 400 $DSTDIR/temporal-masking.png

convert $SRCDIR/b-frames-postponed.png -resize 600 $DSTDIR/b-frames-postponed.png
convert $SRCDIR/p-frame-encoding.png -resize 600 $DSTDIR/p-frame-encoding.png

