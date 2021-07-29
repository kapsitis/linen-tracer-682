#!/bin/bash
if [ -z "$1" ]
then
  echo "Please specify directory"
else
  for file in $1/Pictures/*.png
  do 
    convert $file -trim +repage $file
  done
fi
