#!/bin/bash

CURRENT_WINDOW="$(yabai -m query --windows --window | jq -r '.app')"
YABAI_RESULT="$(yabai -m query --windows)"
RESULT=$(echo "$YABAI_RESULT" | jq -r "map(select(.app == \"$CURRENT_WINDOW\")) | map({id, app, title, hasFocus: .\"has-focus\", isMinimized: .\"is-minimized\"}) | tojson")


RESULT2=$(echo "$RESULT" | jq -r "{yabaiWindows: ., type: \"window\", message: \"$RESULT2\"}")

echo -n "$RESULT2" | nc -U /tmp/notif-overlay.sock
