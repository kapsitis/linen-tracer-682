#!/bin/bash

export SRCDIR="tale-algorithms-lossless-part1/Pictures"
export DSTDIR="tale-algorithms-lossless-part1"

convert $SRCDIR/morse-sample.png -resize 700 $DSTDIR/morse-sample.png
convert $SRCDIR/prefix-tree.png -resize 440 $DSTDIR/prefix-tree.png
convert $SRCDIR/huffman-algorithm.png -resize 700 $DSTDIR/huffman-algorithm.png
convert $SRCDIR/compression-decompression.png -resize 700 $DSTDIR/compression-decompression.png
convert $SRCDIR/switching-x-y.png -resize 300 $DSTDIR/switching-x-y.png

convert $SRCDIR/mississippi.png -resize 350 $DSTDIR/mississippi.png
