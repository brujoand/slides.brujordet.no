#! /usr/bin/env bash

dot=$1

evaluate_dot() {
  local dot_file=$1
  dot_file=${dot##*/}
  output="static/${dot_file/.dot/.png}"
  dot -Tpng -o"$output" "$dot_file"
  echo "$output"
}

if [[ -n "$dot" ]]; then
  open "$(evaluate_dot "$dot")"
else
  for dot in *.dot; do
    output=$(evaluate_dot "$dot")
    echo -e "Generated:\n${output}"
  done
fi

