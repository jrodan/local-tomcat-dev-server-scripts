#!/bin/sh
JR_SCRIPTS_BASE=$1
JR_PROJECT_HOME_NAME=$2
. $JR_SCRIPTS_BASE/env/$JR_PROJECT_HOME_NAME.sh "$JR_SCRIPTS_BASE"

startMysql

JR_START="/bin/catalina.sh"

export JPDA_ADDRESS=8000
export JPDA_TRANSPORT=dt_socket

exec "$JR_TOMCAT"/"$JR_START" jpda start "$@"