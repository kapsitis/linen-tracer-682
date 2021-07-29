#!/bin/bash

export SRCDIR="tale-error-correction-part2/Pictures"
export DSTDIR="tale-error-correction-part2"

convert $SRCDIR/tornado-problem.png -resize 200 $DSTDIR/tornado-problem.png
convert $SRCDIR/hamming-as-tornado.png -resize 300 $DSTDIR/hamming-as-tornado.png


