#!/bin/bash

#아파지 웹서버 설정
#(ㄱ) 패키지 설치
#(ㄴ) 서비스 기동

. /root/bin/func.sh
#1) 패키지 설치
PkgInstall httpd

#2) 서비스 기동
ServiceStart httpd