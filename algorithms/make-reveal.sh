#!/bin/bash
if [ -z "$1" ]
then
  echo "Please specify directory"
else  

  for file in $1/Pictures/*.png
  do 
    convert $file -trim +repage $file
  done

  source resize-string-searching-part2.sh

  cd $1
  pandoc -t revealjs -s -o content.html content.md --slide-level=2 \
    -V revealjs-url=../../reveal.js --metadata pagetitle="Uzdevumi" \
    --mathjax="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" \
    -V theme="white"
fi



