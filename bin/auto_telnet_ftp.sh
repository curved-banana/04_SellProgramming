#!/bin/bash

#1) 원격접속 후 백업수행 -> auto_telnet.sh(tar CMD로 백업)
# tar CMD : tar czf /tmp/home_$(hostname).tar.gz/home
#2) 파일 전송 -> auto_ftp.sh 

#1) 원격접속 후 백업수행 -> auto_telnet.sh(tar CMD로 백업)
# tar CMD : tar czf /tmp/home_$(hostname).tar.gz/home

IP1='192.168.10.20'
BACKUPFILE="home_$IP1.tar.gz"
UNAME='root'
UPASS='soldesk1.'

CMDBackup() {
    sleep 2     ; echo $UNAME
    sleep 0.5   ; echo $UPASS
    sleep 0.5   ; echo "tar czf /tmp/$BACKUPFILE /home"
    sleep 0.5   ; echo 'exit'
}

CMDBackup | telnet $IP1

#2) 파일 전송 -> auto_ftp.sh 



ftp -n $IP1 << EOF
user $UNAME $UPASS

cd /tmp
lcd /test
bin
hash
prompt
mget $BACKUPFILE
quit

EOF