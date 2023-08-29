#!/bin/bash


#설명 서버리스트에있는 서버들에 root사용자로 접속하여 
#cat /var/log/secure* | grep Accepted |egrep -v "(192.168.10.10)" | awk '{print $9"\t"$11"\t"$14}' | sort | uniq
# 를 사용하여 해당서버에 
#로그인 성공한 아이피 목록을 자동으로 보여주는 프로그램

#서버리스트에는 확인하고싶은 서버 ip들이 있음.
SERVERLIST='/root/bin/server.list'

#로그인 로그들이 저장되어있는 경로
LOGLIST='/var/log/secure*'

#사용자부분
UNAME='root'

#패스워드부분 : 해당서버 root사용자의 비밀번호로 입력.
UPASS='soldesk1.'

#수많은 내용중 Accepted가 내용에 포함된 부분만 출력
ACCEPT='grep Accepted'

#egrep -v를 사용해서 제외하고싶은 IP주소 입력
EGREP='egrep -v "(192.168.10.10)"'

#awk를 사용해서 로그인한 사용자이름 , 사용자 IP 부분만 출력
AWK="awk '{print \$1\"\t\"\$2\"\t\"\$9\"\t\"\$11\"\t\"\$14}'"


cat $SERVERLIST | while read IP1

do
    echo "-------------$IP1 의 로그인 기록-------------------"
    CMDLoginlog(){
        sleep 2   ; echo $UNAME
        sleep 1   ; echo $UPASS
        sleep 5  ; echo "cat $LOGLIST | $ACCEPT | $EGREP | $AWK |sort | uniq "
        sleep 5   ; echo 'exit'
    }
    CMDLoginlog | telnet $IP1 
    echo '--------------------------------------------------'
    echo 

done
