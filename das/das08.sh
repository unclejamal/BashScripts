#!/bin/bash
# diffing 2 pages and viewing results in vim
diff -u <(curl www.google.de | tidy) <(curl www.google.fr | tidy) | view -

# working in vi, switching to background to do something, coming back to vi
vi -> ctrl z -> fg

# listing jobs
jobs

# puts last one to foreground
fg

# puts any to foreground (bash)
fg 1

# puts last one to background
bg

# loop
while true; do echo pduda; sleep 1; done


