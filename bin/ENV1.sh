#!/bin/bash

#echo "ENV1.sh"

# * telnet: telnet-server , telnet 
# * ftp    : vsftpd , ftp
#패키지 설치과정
#*패키지설치
#*서비스설정
#*서비스기동
. /root/bin/func.sh

echo "===== [Phase 1 : 패키지 설치]======"
#(1)Telnet 패키지 설치과정
#*1)패키지설치
PkgInstall telnet-server telnet
#*2)서비스설정

#*3)서비스기동
ServiceStart telnet.socket

#(1)Ftp 패키지 설치과정

#*1)패키지설치
PkgInstall vsftpd ftp
#*2)서비스설정
FTPUSERS=/etc/vsftpd/ftpusers
USERLIST=/etc/vsftpd/user_list

sed -i 's/^root/#root/' $FTPUSERS
sed -i 's/^root/#root/' $USERLIST
for i in $FTPUSERS $USERLIST
do
    cat $i | egrep -v '^#|^$' | grep root >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[Fail] $i 설정실패"
        exit 1
    else
        echo "[ok] $i 설정완료"
    fi

done
#*3)서비스기동
#ServiceStart telnet.socket
