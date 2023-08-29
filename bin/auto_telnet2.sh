#!/bin/bash

SERVERLIST=/root/bin/server_telnet.txt


cat $SERVERLIST | while read IP1 UNAME UPASS

do
    CMDGrp1(){
        sleep 2 ; echo "$UNAME"
        sleep 0.5 ; echo "$UPASS"
        sleep 0.5 ; echo 'hostname'
        sleep 0.5 ; echo 'date'
        sleep 0.5 ; echo 'exit'
    }
    CMDGrp1 | telnet $IP1
done
