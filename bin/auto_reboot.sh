#!/bin/bash

#변수정의
SERVERLIST=/root/bin/server.list
ALIVESERVERLIST=/root/bin/alive_server.list
> $ALIVESERVERLIST

#0)준비단계
cat << EOF > /root/bin/server.list
192.168.10.20
192.168.10.30

EOF



#1) 살아있는 서버 목록 만들기

for i in $(cat $SERVERLIST)
do
    
    ping -c 1 -W 1 "$i" >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[OK] $i "
        echo "$i" >> $ALIVESERVERLIST
    else
        echo "[fail] $i" 
    fi
done

cat $ALIVESERVERLIST | while read HOST2
do
    UNAME='root'
    UPASS='soldesk1.'

    CmdReboot(){
    sleep 1.5    ;   echo "$UNAME"
    sleep 0.3   ;    echo "$UPASS"
    sleep 0.3   ;    echo 'reboot'
    sleep 0.3  ;    echo 'exit'

    }
    CmdReboot | telnet $HOST2
done