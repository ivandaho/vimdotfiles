#!/bin/bash

CURRENT_WINDOW="$(yabai -m query --windows --window | jq -r '.app')"
YABAI_RESULT="$(yabai -m query --windows)"
# RESULT=$(echo "$YABAI_RESULT" | jq -r "map(select(.app == \"$CURRENT_WINDOW\")) | map({id, title, \"has-focus\"}) | map(if .\"has-focus\" == true then \"> \" + .title else \"  \" + .title end) | .[]")
RESULT=$(echo "$YABAI_RESULT" | jq -r "map(select(.app == \"$CURRENT_WINDOW\")) | map({id, app, title, hasFocus: .\"has-focus\", isMinimized: .\"is-minimized\"}) | tojson")

echo -n "$RESULT" | nc -U /tmp/notif-overlay.sock
