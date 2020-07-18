#!/usr/bin/env bash

for md_folder in ./slides/*; do
  echo "Handling ${md_folder}"
  for md_file in "$md_folder"/*.md; do
    echo "Handling ${md_file}"
    html_file=${md_file/.md/.html}
    echo "Generating ${html_file}"
    pandoc -s -t revealjs \
      --variable transition=linear \
      -V theme=blood \
      -V revealjs-url=../../reveal.js \
      -o "$html_file" "$md_file"
  done
done

echo 'Done'
