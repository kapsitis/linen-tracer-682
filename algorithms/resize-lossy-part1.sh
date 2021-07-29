#!/bin/bash

export SRCDIR="tale-algorithms-lossy-part1/Pictures"
export DSTDIR="tale-algorithms-lossy-part1"

convert $SRCDIR/picture-YIQ_components1.jpg -resize 330 $DSTDIR/picture-YIQ_components1.jpg
convert $SRCDIR/picture-YIQ_components2.jpg -resize 330 $DSTDIR/picture-YIQ_components2.jpg

convert $SRCDIR/color-planes.png -resize 400 $DSTDIR/color-planes.png
convert $SRCDIR/quantization-illustration.png  -resize 700 $DSTDIR/quantization-illustration.png
convert $SRCDIR/YIQ_IQ_plane.svg.png  -resize 500 $DSTDIR/YIQ_IQ_plane.svg.png

convert $SRCDIR/hondt-allocation.png  -resize 600 $DSTDIR/hondt-allocation.png
convert $SRCDIR/sainte-lague.png  -resize 600 $DSTDIR/sainte-lague.png

convert $SRCDIR/sparser-grid.png  -resize 400 $DSTDIR/sparser-grid.png
convert $SRCDIR/dct-formulae.png  -resize 450 $DSTDIR/dct-formulae.png
