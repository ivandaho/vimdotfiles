#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

mystring="${YABAI_EVENT}"
if [ "$YABAI_EVENT" = "true" ]; then
  mystring="Disabled"
else
  mystring="Enabled"
fi

mystring="${mystring}":"$(yabai -m query --windows --window | jq '.app')"

sketchybar --set "$NAME" label=${mystring}
sketchybar --bar hidden=off
sleep 1
sketchybar --bar hidden=on
