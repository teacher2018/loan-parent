#!/bin/bash -e
echo "stop spring boot server"


stop(){
    pid=`jps -lv |grep "$APPLICATION_NAME" | awk '{print $1}'`

    if [ "$pid" != '' ] ; then
        kill -15 $pid
        sleep 10s
    fi

    pid=`jps -lv |grep "$APPLICATION_NAME" | awk '{print $1}'`

    for i in $pid
    do
        echo ">>>kill $APPLICATION_NAME pid : $i"
        kill -9 $i ;
    done
}

backups(){
    if [ -f /stock/application/$APPLICATION_NAME.jar -a "$ENV" = "prod" ] ;
    then
        echo " start backup /stock/application/$APPLICATION_NAME.jar "
        bakUrl=/stock/backups/application/`date "+%Y%m%d"`
        bakPrefix=`date "+%H%M%S"`
        mkdir -p $bakUrl
        mv /stock/application/$APPLICATION_NAME.jar "$bakUrl/$APPLICATION_NAME.jar-$bakPrefix"
    fi
}


APPLICATION_NAME="${1}"
ENV="prod";
JAVA_OPT="-Xmx1024m -Xms512m -Djava.security.egd=file:/dev/./urandom";
JVM_OPT=" -Djava.security.egd=file:/dev/./urandom -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/stock/application/console/ "
JAVA_PARAM=""

for arg in "$@"
do
    if [ "$APPLICATION_NAME" = "$arg" ]; then
        continue;
    fi

    if [ $arg = "-dev" ] ; then
        ENV="dev" ;
        JAVA_OPT="-Xmx256m -Xms256m $JVM_OPT -Dspring.profiles.active=dev";
    elif [ $arg = "-test" ] ; then
        ENV="test";
        JAVA_OPT="-Xmx512m -Xms512m $JVM_OPT -Dspring.profiles.active=test";
    elif [ $arg = "-prod" ] ; then
        ENV="prod";
        JAVA_OPT="-Xmx1500m -Xms512m $JVM_OPT -Dspring.profiles.active=prod";
    else
        JAVA_PARAM="$JAVA_PARAM --$arg"
    fi
done

JAVA_PARAM=$(echo $@ |awk -F"${2}" '{print $2}')

echo ">>>> use ENV: $ENV"
echo ">>>> use java opt: $JAVA_OPT"
echo ">>>> use app name: $APPLICATION_NAME"

if [ ! -n "$APPLICATION_NAME" ]; then
 echo ">>>>>>>>>>>>NOT SET APPLICATION_NAME EXIT<<<<<"
 exit 1
fi


# >>>>>>>>>>>> stop <<<<<<<<<<<<<<
stop ;

# >>>>>>>>>>>> backups <<<<<<<<<<<<<<
backups ;



echo "run application server "

! test -d /stock/application/console/ && mkdir -p /stock/application/console/

/bin/cp ./$APPLICATION_NAME/target/*.jar /stock/application/$APPLICATION_NAME.jar

nohup java $JAVA_OPT -jar /stock/application/$APPLICATION_NAME.jar $JAVA_PARAM > /stock/application/console/$APPLICATION_NAME.log 2>&1  &

echo "run application server ok"
