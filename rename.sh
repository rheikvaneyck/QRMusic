#!/bin/bash
#rename.sh
fs=$IFS
IFS=$(echo -en "\n\b")
for i in *.mp3; do 
  id3v2 -A "$1" "$i"; 
done
IFS=$fs
