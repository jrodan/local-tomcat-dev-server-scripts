#!/bin/sh
JR_SCRIPTS_BASE=$1
JR_PROJECT_HOME_NAME=$2
. $JR_SCRIPTS_BASE/env/$JR_PROJECT_HOME_NAME.sh "$JR_SCRIPTS_BASE"

JR_STOP="/bin/shutdown.sh"

SHUTDOWN_WAIT=8

tomcat_pid() {
    echo `ps aux | grep org.apache.catalina.startup.Bootstrap | grep -v grep | awk '{ print $2 }'`
}

stop() {
    pid=$(tomcat_pid)
    if [ -n "$pid" ]
    then
        echo "Stoping Tomcat"
        sh "$JR_TOMCAT"/"$JR_STOP"

    let kwait=$SHUTDOWN_WAIT
    count=0
    count_by=5
    until [ `ps -p $pid | grep -c $pid` = '0' ] || [ $count -gt $kwait ]
    do
        echo "Waiting for processes to exit. Timeout before we kill the pid: ${count}/${kwait}"
        sleep $count_by
        let count=$count+$count_by;
    done

    if [ $count -gt $kwait ]; then
        echo "Killing processes which didn't stop after $SHUTDOWN_WAIT seconds"
        kill -9 $pid
    fi
    else
        echo "Tomcat is not running"
    fi

    return 0
}	

#exec "$JR_TOMCAT"/"$JR_STOP" stop "$@"
#pid=$(tomcat_pid)
#kill -3 $pid
stop