#!/bin/bash
directories=( */ )
#declare -i number
number=${#directories[*]}
let number=$number-1
for dir in $(seq 0 $number)
do
    trailer_dir=${directories[dir]}Trailers/
    if [ -d "$trailer_dir" ]; then
      echo ${directories[dir]}": Trailer folder exists"
      ls "${trailer_dir[*]}"
    else
      echo ${directories[dir]}": No trailer folder"
      mkdir "$trailer_dir"
      /usr/local/bin/youtube-dl "ytsearch1: ${directories[dir]} trailer" -o "$trailer_dir/%(title)s.%(ext)s"
    fi
done
