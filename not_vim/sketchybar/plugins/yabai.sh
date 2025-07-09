#!/bin/bash

PIDFILE="/tmp/sketchybar_yabai.pid"

MYOBJ="$(yabai -m query --windows --window | jq "{app, \"is-floating\"}")"

isFloating=$(echo "$MYOBJ" | jq -r 'if ."is-floating" == true then "Disabled" else "Enabled" end')
app=$(echo "$MYOBJ" | jq -r '.app')
sketchybar --set "$NAME" label="${isFloating}: ${app}" \
                         drawing=on
echo $$ > "$PIDFILE"
sleep 3

if [ -f "$PIDFILE" ] && [ "$(cat "$PIDFILE")" = "$$" ]; then
  sketchybar --set yabai drawing=off
  rm -f "$PIDFILE"
fi
