#!/bin/bash

WebServerUsage(){
    echo "Usage: $0 {httpd|nginx}"
    exit 1

}


PkgInstall(){
    PKG="$*"
    rpm -q "$PKG" > /dev/null 2>&1
    if [ $? -ne 0 ] ; then
        yum -q -y install $PKG >/dev/null 2>&1 \
        && echo "[ok ] $PKG 설치성공"\
        || echo "[fail] $PKG 설치 실패"
    fi
}

: << EOF
ServiceStart(){
    SRV=$1

    case $SRV in
        nginx) INVER_SRV=httpd ;;
        httpd) INVER_SRV=nginx ;;
        * ) echo "[FAIL] nginx|httpd"
    esac
    systemctl disable --now $INVER_SRV >/dev/null 2>&1
    systemctl enable --now $SRV >/dev/null 2>&1 \
    && echo "[ok] $SRV 서비스기동" \
    ||echo "[fail] $SRV 서비스기동실패"

}
EOF

ServiceStart(){
    SRV=$1
    systemctl enable $SRV >/dev/null 2>&1 \
    && echo "[ok] $SRV 서비스 enable 성공" \
    || echo "[fail ] $SRV 서비스 enable 실패"
    systemctl restart $SRV >/dev/null 2>&1 \
    && echo "[ok] $SRV 서비스 start 성공" \
    || echo "[fail ] $SRV 서비스 start 실패"
}

function print_good () {
    echo -e "\x1B[01;32m[+]\x1B[0m $1"
}

function print_error () {
    echo -e "\x1B[01;31m[-]\x1B[0m $1"
}

function print_info () {
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}

