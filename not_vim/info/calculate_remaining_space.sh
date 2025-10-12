#!/bin/bash

# Input string format: 'USED GiB/TOTAL GiB'
input_string=$(fastfetch | grep 'Disk (/)') 

# Use awk to extract the numbers, calculate the difference, and print the result
awk '{
  # Remove the prefix "Disk (/): "
  sub(/.*: /, "")
  # Now the string is in the format "USED GiB/TOTAL GiB"
  split($0, parts, "/")
  used = parts[1]
  total = parts[2]
  gsub(/ GiB/, "", used)
  gsub(/ GiB/, "", total)
  remaining = total - used
  printf "%.2f GiB remaining\n", remaining
}' <<< "$input_string"
