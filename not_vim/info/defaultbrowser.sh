#!/bin/bash
if [ -n "$1" ]; then
    MSG="$1"
else
    MSG=$(defaultbrowser | grep '^\*' | sed 's/^\* //')
fi
echo -n "Default browser: $MSG" | nc -U /tmp/notif-overlay.sock
