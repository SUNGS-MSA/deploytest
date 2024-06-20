#!/bin/bash
REPOSITORY=/root/workspace

cd $REPOSITORY/deploytest/

echo "### check running application... ###"

CURRENT_PID=$(pgrep -f deploytest)

echo "$CURRENT_PID"

if [ -z $CURRENT_PID ]; then
    echo "### Not found running application ###"
else
    echo "## Found application!! try to kill process $CURRENT_PID ###"
    kill -9 $CURRENT_PID
    sleep 3
fi
echo "### Ready to deploy ###"

#JAR_NAME=$(ls $REPOSITORY/deploytest |grep 'deploytest' | tail -n 1)
JAR_NAME=$(ls $REPOSITORY/deploytest |grep 'deploytest' | grep -v 'plain' | tail -n 1) #plain jar는 제외


echo "### Source file Name: $JAR_NAME ###"

nohup java -jar $REPOSITORY/deploytest/$JAR_NAME >> $REPOSITORY/deploytest/nohup.out 2>&1 &     # >>는 내용 이어쓰기, >는 내용 덮어쓰기


NEW_PID=$(pgrep -f deploytest)
echo "## NEW_PID  is  $NEW_PID ###"
