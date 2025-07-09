#!/usr/bin/env sh

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
