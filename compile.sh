#!/usr/bin/env bash

shopt -s nullglob

rm -f index.html

for md_folder in *; do
  [[ ! -d "$md_folder" ]] && continue
  [[ "$md_folder" == 'reveal.js' ]] && continue
  for md_file in "$md_folder"/*.md; do
    echo "Handling ${md_file}"
    title="$(tr '_' ' ' <<< "$md_folder")"
    html_file=${md_file/.md/.html}
    echo "Generating ${html_file}"
    pandoc -s -t revealjs \
      --metadata title="$title" \
      --highlight-style=zenburn.theme \
      -V transition=slide \
      -V backgroundTransition=fade \
      -V theme=brujoand \
      -V controls=false \
      -V slideNumber=\"c/t\" \
      -V disableLayout=false \
      -V center=true \
      -V revealjs-url=../reveal.js \
      -o "$html_file" "$md_file"
    echo "<a href='$html_file'>${md_folder##*/}/${md_file##*/}</a>" >> index.html
  done
done

echo 'Done'

