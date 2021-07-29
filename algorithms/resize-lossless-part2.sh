#!/bin/bash

export SRCDIR="tale-algorithms-lossless-part2/Pictures"
export DSTDIR="tale-algorithms-lossless-part2"

convert $SRCDIR/info-content.png -resize 300 $DSTDIR/info-content.png
convert $SRCDIR/entropy-graph.png -resize 300 $DSTDIR/entropy-graph.png
convert $SRCDIR/arithmetic-babc.png -resize 400 $DSTDIR/arithmetic-babc.png
convert $SRCDIR/LZ78-encode.png -resize 600 $DSTDIR/LZ78-encode.png
convert $SRCDIR/LZ78-decode.png -resize 600 $DSTDIR/LZ78-decode.png
convert $SRCDIR/trie-koks.png -resize 354 $DSTDIR/trie-koks.png
convert $SRCDIR/markov-chain.png -resize 300 $DSTDIR/markov-chain.png



