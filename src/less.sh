#!/bin/sh
JR_SCRIPTS_BASE=$1
JR_PROJECT_HOME_NAME=$2
. $JR_SCRIPTS_BASE/env/$JR_PROJECT_HOME_NAME.sh "$JR_SCRIPTS_BASE"

osascript <<END
tell application "iTerm2"
	tell current window
        create tab with default profile
        tell the last tab
        	select
    	end tell  
    	tell current session
    		write text "less $JR_TOMCAT/logs/catalina.out"
    		tell application "System Events" to keystroke "f" using {shift down}
    	end tell  
    end tell
end tell
END