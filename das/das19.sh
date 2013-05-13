#!/bin/bash

# find -iname - as name but case insensitive
# grep -h - show only matching content (without the matched file name)
# sed ... - remove initial spaces from the line
# cut ... - take the second column
# grep -l - file name of each matching file 
# sort -n - natural sort (as opposed to alphanumerical)

function class_count {
  grep -rl "\b$class\b" app lib --include="*.rb" |
  wc -l
}

function main {
  find app lib -iname '*.rb' |
  xargs grep -h '^[[:space:]]*class\|module\b' |
  sed 's/^[[:space:]]*//' | cut -d ' ' -f 2 |
  while read class; do
    echo "`class_count` $class";
  done |
  sort -n
}

main
