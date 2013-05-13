#!/bin/bash
# grep -o - show only matching part
# grep -h - don't show the file name
# grep -l - show only the file name
# grep -v - invert match


# how many production files reference the $class
function class_count {
  grep -rl "\b$class\b" --include="*.java" |
  grep -v '\btest\b' |
  wc -l
}

function all_classes {
  find -iname '*.java' |
  grep -v '\btest\b' |
  xargs grep -oh 'class[[:space:]].*' |
  cut -d ' ' -f 2
}

function main {
  for class in `all_classes`; do
    echo "`class_count` $class";
  done |
  sort -n
}

main
