#!/bin/bash

export SRCDIR="tale-algorithms-lossless-part3/Pictures"
export DSTDIR="tale-algorithms-lossless-part3"

convert $SRCDIR/png-compression-level-photograph.png -resize 800 $DSTDIR/png-compression-level-photograph.png
convert $SRCDIR/png-ratio-vs-block-size.png -resize 800 $DSTDIR/png-ratio-vs-block-size.png 

convert $SRCDIR/text-after-th.png -resize 800 $DSTDIR/text-after-th.png
convert $SRCDIR/sorted-contexts.png  -resize 800 $DSTDIR/sorted-contexts.png
convert $SRCDIR/inverse-lexicographic-sort.png -resize 400 $DSTDIR/inverse-lexicographic-sort.png 
convert $SRCDIR/cyclic-permuations.png -resize 300 $DSTDIR/cyclic-permuations.png
convert $SRCDIR/alpha-sort.png -resize 600 $DSTDIR/alpha-sort.png

#CompTimeByCompTime.csv
#RatioByRatio.csv




