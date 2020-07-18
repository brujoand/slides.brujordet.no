#!/usr/bin/env bash

for md_folder in ./slides/*; do
  folder_name=${md_folder##*/}
  echo "Handling ${folder_name}"
  mkdir "./docs/slides/${folder_name}"
  if [[ -d "${md_folder}/static" ]]; then
    echo "Copying static files for ${folder_name}"
    cp -r "${md_folder}/static" "./docs/slides/${folder_name}/static"
  fi
  for md_file in "$md_folder"/*.md; do
    md_file_name=${markdown##*/}
    echo "Handling ${md_file_name}"
    html_file_name=${md_file_name/.md/.html}
    pandoc -s -t revealjs \
      --variable transition=linear \
      -V theme=blood \
      -V revealjs-url=../reveal.js \
      -o "./doc/slides/${folder_name}/${html_file_name}" "$md_file"
  done
done

echo 'Done'
