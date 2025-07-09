#!/bin/bash

LOCKFILE="/tmp/sketchybar_yabai_popup.ids"
PIDFILE="/tmp/sketchybar_yabai_popup.pid"

sketchybar --set yabai drawing=off \
                     popup.drawing=off

# Remove previous items using IDs from lockfile
if [ -f "$LOCKFILE" ]; then
  while IFS= read -r id; do
    [ -n "$id" ] && sketchybar --remove "w.${id}"
  done < "$LOCKFILE"
  rm -f "$LOCKFILE"
fi

CURRENT_WINDOW="$(yabai -m query --windows --window | jq '.app')"
# remove start and end extra double quotes
CURRENT_WINDOW=${CURRENT_WINDOW#\"}
CURRENT_WINDOW=${CURRENT_WINDOW%\"}
YABAI_RESULT="$(yabai -m query --windows)"

# Get array of objects as a JSON array
MYARRAY=$(echo "$YABAI_RESULT" | jq "map(select(.app == \"$CURRENT_WINDOW\")) | map({id, title, \"has-focus\"})")

ids=()

# Loop over each object in the array
while IFS= read -r item; do
  id=$(echo "$item" | jq '.id')
  title=$(echo "$item" | jq -r '.title')
  has_focus=$(echo "$item" | jq '.["has-focus"]')
  if [ "$has_focus" = "true" ]; then
    title="> $title"
  else
    title="  $title"
  fi

  sketchybar --add item w.${id} popup.yabai \
             --set w.${id} label="${title}" \
                   blur_radius=30

  ids+=("$id")
  echo "$id" >> "$LOCKFILE"
done < <(echo "$MYARRAY" | jq -c '.[]')

sketchybar --set yabai drawing=on \
                       popup.drawing=on

# Write current PID to PIDFILE
echo $$ > "$PIDFILE"

sleep 3


# Only remove items if this is the latest script instance
if [ -f "$PIDFILE" ] && [ "$(cat "$PIDFILE")" = "$$" ]; then
  sketchybar --set yabai drawing=off \
                       popup.drawing=off
  for id in "${ids[@]}"; do
    sketchybar --remove "w.${id}"
  done
  rm -f "$PIDFILE"
  rm -f "$LOCKFILE"
fi
