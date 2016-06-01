#!/bin/sh
JR_SCRIPTS_BASE=$1
JR_PROJECT_HOME_NAME=$2
. $JR_SCRIPTS_BASE/env/$JR_PROJECT_HOME_NAME.sh "$JR_SCRIPTS_BASE"

mvn clean install -f $JR_WORKSPACE/$JR_EXT/$JR_EXT-ext-impl/pom.xml
echo "#### start copy"
cp $JR_WORKSPACE/$JR_EXT/$JR_EXT-ext-impl/target/$JR_EXT-ext-impl-1.0.0-SNAPSHOT.jar $JR_TOMCAT_ROOT/WEB-INF/lib
echo "#### finished ext-deploy"