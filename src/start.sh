#!/bin/sh
JR_SCRIPTS_BASE=$1
JR_PROJECT_HOME_NAME=$2
. $JR_SCRIPTS_BASE/env/$JR_PROJECT_HOME_NAME.sh "$JR_SCRIPTS_BASE"

## call function to start mysql 
startMysql

## startSmtpServer
startSmtpServer $JR_SCRIPTS_BASE

JR_START="/bin/startup.sh"

exec "$JR_TOMCAT"/"$JR_START" start "$JR_TOMCAT_ENVS"
# exec "$JR_TOMCAT"/"$JR_START" start "$@"

exec "$JR_SCRIPTS_SRC/less.sh"



#
# TODOS
# - create start script global to use only one file to start with params
# - cleanup structure to not need to include jar in lib in every project
# - using tomcat user as user to start tomcat
#