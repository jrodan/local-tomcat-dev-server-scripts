#!/bin/sh
JR_SCRIPTS_BASE=$1
JR_PROJECT_HOME_NAME=$2
. $JR_SCRIPTS_BASE/env/$JR_PROJECT_HOME_NAME.sh "$JR_SCRIPTS_BASE"

echo "empty path: $JR_TOMCAT/temp/*"
rm -rf "$JR_TOMCAT"/temp/*
echo "empty path: $JR_TOMCAT/work/*"
rm -rf "$JR_TOMCAT"/work/*
echo "#### finished clean-tomcat"
