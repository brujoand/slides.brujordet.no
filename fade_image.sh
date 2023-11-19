#!/usr/bin/env bash

input=$1

if [[ -z "$input" ]]; then
  echo "We need an image to fade"
  exit 1
fi

filename=${input##*/}
extention=${input##*.}
name=${filename%.*}
output="${name}_faded.${extention}"

echo "Fading ${input} as ${output}"

convert "$input" -colorspace Gray -fill black -colorize 60% -filter Gaussian -blur 0x8 "$output"
