#!/bin/sh
JR_SCRIPTS_BASE=$1
JR_PROJECT_HOME_NAME=$2
. $JR_SCRIPTS_BASE/env/$JR_PROJECT_HOME_NAME.sh "$JR_SCRIPTS_BASE"

exec "$JR_SCRIPTS_SRC/clean-tomcat.sh" start "$@"

find "$JR_TOMCAT_ROOT/WEB-INF/lib/" -name "$JR_EXT*.jar" -exec rm -rf {} \;
find "$JR_TOMCAT_ROOT/WEB-INF/" -name "$JR_EXT*.xml" -exec rm -rf {} \;
find "$JR_TOMCAT/lib/ext/" -name "$JR_EXT*.jar" -exec rm -rf {} \;
find "$JR_TOMCAT/webapps/ext/" -name "$JR_EXT" -exec rm -rf {} \;

echo "#### finished ext-clean"