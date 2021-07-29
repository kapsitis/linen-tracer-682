#!/bin/bash

export SRCDIR="tale-linear-optimization-part1/Pictures"
export DSTDIR="tale-linear-optimization-part1"

convert $SRCDIR/graphical-interpretation.png -resize 500 $DSTDIR/graphical-interpretation.png
convert $SRCDIR/locate-maximum.png -resize 500 $DSTDIR/locate-maximum.png
convert $SRCDIR/feasible-region.png -resize 500 $DSTDIR/feasible-region.png
convert $SRCDIR/lp-polygon.png -resize 500 $DSTDIR/lp-polygon.png



