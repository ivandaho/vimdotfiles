#!/bin/bash

CURRENT_WINDOW="$(yabai -m query --windows --window | jq -r '.app')"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# RESULT2=$(fastfetch -c none -l none --pipe true -s Swap:Disk)
RESULT2=$("$SCRIPT_DIR/calculate_remaining_space.sh")
#

CONV="$(echo -n "$RESULT2" | jq -Rs .)"
# CONV="$(printf "%q" "$RESULT2")"
# echo $CONV
#
RESULT2="{\"yabaiWindows\": [], \"type\": \"message\", \"message\": \"$RESULT2\"}"
echo $RESULT2
# RESULT3="$(echo -n "$RESULT2" | jq -Rsa)"
# # RESULT3="$(printf "%q" "$RESULT2")"
# echo $RESULT3
echo -n "$RESULT2" | nc -U /tmp/notif-overlay.sock
