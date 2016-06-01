#!/bin/sh
JR_SCRIPTS_BASE=$1
JR_PROJECT_HOME_NAME=$2
. $JR_SCRIPTS_BASE/env/$JR_PROJECT_HOME_NAME.sh "$JR_SCRIPTS_BASE"

osascript <<END
tell application "iTerm"
 tell the first terminal
  launch session "Default Session"
  tell the last session
   write text "less $JR_TOMCAT/logs/catalina.out"
   tell application "System Events" to keystroke "f" using {shift down}
  end tell
 end tell
end tell
END