#!/usr/bin/env bash

trap 'echo oh, I ded ; exit' INT

while true; do
  fswatch -e '.git/' -e '*.html' -r -1 . > /dev/null
  ./compile.sh
  sleep 1
done
