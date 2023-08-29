#!/bin/bash

Adminlist(){
    cat << EOF
    (관리 목록)
------------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
------------------------------------
EOF
}

UserList(){
    cat << EOF
(사용자 목록)
------------------------------------
$(awk -F: '$3 >= 1000 && $3 <=60000 {print $1}' /etc/passwd)
------------------------------------
EOF
}

UserDel(){
    echo -n "삭제할 사용자 이름?: "
    read UNAME

    grep -w $UNAME /etc/passwd >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        userdel -r $UNAME \
            && echo "[ok] $UNAME 사용자가 삭제됨" \
            || echo "[Fail] $UNAME 사용자가 삭제되지않음"
    else
        echo "[fail] $UNAME 사용자가 없음"

    fi
}

UserAdd(){
    echo "(사용자 추가)"
    echo -n " 추가할 사용자 이름: "
    read UNAME

    useradd $UNAME >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        echo "[OK] $UNAME 사용자 추가완료"
        echo $UNAME | passwd --stdin $UNAME >/dev/null 2>&1
        echo "[ok] $UNAME 사용자 암호 설정 완료"
    else
        echo "[fail] $UNAME 추가 실패"

    fi
}

while true
do
    Adminlist
    echo -n "선택번호는 : " 
    read NUM
    case $NUM in
        1) UserAdd ;;
        2) UserList ;;
        3) UserDel ;;
        4) break ;;
        *) echo "[INFO ] 잘못된 번호 입력" ;;

    esac
    echo

done