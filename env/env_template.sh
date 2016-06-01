JR_SCRIPTS_BASE=$1
. $JR_SCRIPTS_BASE/env/global.sh
. $JR_SCRIPTS_BASE/src/functions.sh

## to change
JR_PROJECT_HOME="/Users/jrodan/dev/lr/lr6/"

JR_PROJECT_HOME_NAME=`basename $JR_PROJECT_HOME`
JR_WORKSPACE="$JR_PROJECT_HOME/workspace/"
JR_TOMCAT="$JR_PROJECT_HOME/liferay-portal/tomcat/"
JR_TOMCAT_ROOT="$JR_TOMCAT/webapps/ROOT/"
#JAVA_HOME=""
JR_EXT=

# set java version
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home