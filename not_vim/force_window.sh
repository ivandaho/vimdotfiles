#!/bin/bash

# Bounding box
B_X=1171
B_Y=1638
B_W=1512
B_H=74

# Max height
MAX_H=870

# Get focused window frame information
WINDOW_INFO=$(yabai -m query --windows --window)
W_X=$(echo "$WINDOW_INFO" | jq -r '.frame.x')
W_Y=$(echo "$WINDOW_INFO" | jq -r '.frame.y')
W_W=$(echo "$WINDOW_INFO" | jq -r '.frame.w')
W_H=$(echo "$WINDOW_INFO" | jq -r '.frame.h')

# Calculate rectangle boundaries
W_X_MAX=$(echo "$W_X + $W_W" | bc)
W_Y_MAX=$(echo "$W_Y + $W_H" | bc)
B_X_MAX=$(echo "$B_X + $B_W" | bc)
B_Y_MAX=$(echo "$B_Y + $B_H" | bc)

# Check for collision
COLLISION_X=$(echo "$W_X < $B_X_MAX && $W_X_MAX > $B_X" | bc)
COLLISION_Y=$(echo "$W_Y < $B_Y_MAX && $W_Y_MAX > $B_Y" | bc)

if [ "$COLLISION_X" -eq 1 ] && [ "$COLLISION_Y" -eq 1 ]; then
    # Move window below the bounding box
    yabai -m window --move abs:"$W_X":"$B_Y_MAX"

    # Check if height needs to be resized
    if [ "$(echo "$W_H > $MAX_H" | bc)" -eq 1 ]; then
        yabai -m window --resize abs:"$W_W":"$MAX_H"
    fi
fi