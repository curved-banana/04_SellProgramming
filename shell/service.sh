#!/bin/bash
#service.sh UNIT start|stop
# ->systemctl start UNIT

. /root/shell/functions.sh


if [ $# -ne 2 ]; then
    echo "Usage : $0 <UNIT> start|stop|restart"
    exit 1
fi
SRV=$1
ACT=$2


case $ACT in
#ACT=start|restart
#-> systemctl enable
#-> systemctl rstart
    start|restart)
        ServiceStart $SRV
        : << EOF
        systemctl enable $SRV 
        if [ $? -eq 0 ]; then
            echo "[ok ] $SRV enabled"
        else
            echo "[fail] $SRV not enable"
        fi 
        systemctl restart $SRV > /dev/null 2>&1
        if [ $? -eq 0 ]; then 
            echo "[ok ] $SRV started"
        else
            echo "[fail] $SRV not started"
        fi ;;
EOF
    ;;    
#ACT=stop 
#->systemctl disable
#-> systemctl stop
    stop) 
        ServiceStop $SRV
        : << EOF
        systemctl stop $SRV  >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[ok ] $SRV stopped"
        else
            echo "[fail] $SRV not stoped"
        fi 
        systemctl disable $SRV >/dev/null 2>&1
        if [ $? -eq 0 ]; then 
            echo "[ok ] $SRV disable"
        else
            echo "[fail] $SRV not disabled"
        fi ;;
EOF
    ;;
    *) echo "Usage : $0 <UNIT> start|stop|restart"
    exit 2 ;;

esac





