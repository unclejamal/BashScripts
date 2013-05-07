#!/bin/bash

# when one of the commands fails, the whole script fails
set -e

file_pattern=$1

function main {
  for rev in `revisions`; do
    echo "`number_of_lines` `commit_description`"
  done
}

function revisions {
  git rev-list --reverse HEAD
}

# awk picks the 3rd column (can be used to reorder columns)
# xargs smashes output lines in one space-separated line
# grep uses quotes for empty variable (empty string has no effect, but no argument at all throws an exception)
function number_of_lines {
  git ls-tree -r $rev |
  grep "$file_pattern" |
  awk '{print $3}' |
  xargs git show |
  wc -l
}

function commit_description {
  git log --oneline -1 $rev
}

main
