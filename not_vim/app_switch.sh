#!/bin/bash

/usr/bin/env osascript <<SCRIPT
-------------------------------------
tell application "$1"
  activate
  if (count windows) is 0 then
    do shell script "open -a '$1'"
  end if
end tell
-------------------------------------
SCRIPT

source /Users/$USER/.config/nvim/not_vim/notif_trigger.sh
