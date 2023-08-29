#!/bin/bash

ServiceStart(){
    SERVICE=$1
    systemctl enable $SERVICE 
    if [ $? -eq 0 ]; then
        echo "[ok ] $SERVICE enabled"
    else
        echo "[fail] $SERVICE not enable"
    fi 
    systemctl restart $SERVICE > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        echo "[ok ] $SERVICE started"
    else
        echo "[fail] $SERVICE not started"
    fi 
}

ServiceStop(){
    SERVICE=$1
    systemctl stop $SERVICE  >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[ok ] $SERVICE stopped"
        else
            echo "[fail] $SERVICE not stoped"
        fi 
        systemctl disable $SERVICE >/dev/null 2>&1
        if [ $? -eq 0 ]; then 
            echo "[ok ] $SERVICE disable"
        else
            echo "[fail] $SERVICE not disabled"
        fi 
}

EvalLect(){
NUMBER=$1
MESS=$2

ON=no
while [ "$ON" = 'no' ]
do
    echo -n "$NUMBER. $MESS (0~100): "
    read point

    #echo "$point1"

    echo -n "입력한 점수가 이게맞노? ("$point" 점) :  "
    read pointyes

    case $pointyes in
        yes|YES|Yes|y|Y) ON=yes 
        echo "$NUMBER: $point" >> $Result
        ;;
        
        no|NO|No|N|n) ON=no ;;
        *) echo "다시입력 :  "
            ON=no
    esac
done
}




