#!/bin/bash

JR_SCRIPTS_BASE=`dirname $0`

OPTION=""
PROJECT=""
PWD=`pwd`

if [ $# == 2 ] ; then
        OPTION=$2
        PROJECT=$1
else 
        echo "loading default environment and trying to handle the tomcat by finding it depending on the current folder"
        # check if global autodetect function will be used
        ## DXP only
        ## if the script will be started from a dxp-workspace folder, it searches for the correct params

        # load default
        . $JR_SCRIPTS_BASE/env/default.sh "$JR_SCRIPTS_BASE"

        OPTION=$1
        PROJECT="default"
fi

# start the correct script
case "$OPTION" in
        1|start)
                echo "starting tomcat"
                exec $JR_SCRIPTS_BASE/src/start.sh "$JR_SCRIPTS_BASE" "$PROJECT"
                ;;
        2|stop)
                echo "stopping tomcat"
                exec $JR_SCRIPTS_BASE/src/stop.sh "$JR_SCRIPTS_BASE" "$PROJECT"
                ;;
        3|clean)
                echo "cleaning tomcat"
                exec $JR_SCRIPTS_BASE/src/clean-tomcat.sh "$JR_SCRIPTS_BASE" "$PROJECT"
                ;;
        4|ext-clean)
                echo "cleaning ext"
                exec $JR_SCRIPTS_BASE/src/ext-clean.sh "$JR_SCRIPTS_BASE" "$PROJECT"
                ;;
        5|ext-deploy)
                echo "ext deploy"
                exec $JR_SCRIPTS_BASE/src/ext-deploy.sh "$JR_SCRIPTS_BASE" "$PROJECT"
                ;;
        6|start-debug)
                echo "starting tomcat in debug mode"
                exec $JR_SCRIPTS_BASE/src/start-debug.sh "$JR_SCRIPTS_BASE" "$PROJECT"
                ;;
        7|less)
                echo "show logfile"
                exec $JR_SCRIPTS_BASE/src/less.sh "$JR_SCRIPTS_BASE" "$PROJECT"
                ;;
        8|pwd)
                echo "project folder path"
                exec $JR_SCRIPTS_BASE/src/pwd.sh "$JR_SCRIPTS_BASE" "$PROJECT"
                ;;
        9|status)
                check
                ;;
        10|smtp)
                . $JR_SCRIPTS_BASE/src/functions.sh
                startSmtpServer "$JR_SCRIPTS_BASE"
                ;;
        *)
                cat "$JR_SCRIPTS_BASE/src/info.txt"
                exec $JR_SCRIPTS_BASE/src/output-envs.sh "$JR_SCRIPTS_BASE" 
                exit 1
esac

