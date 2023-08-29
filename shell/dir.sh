#!/bin/bash

echo -n "파일입력 : "
read file1 

echo $file1

if [ -f $file1 ] ; then
    echo "정상파일임"
elif [ -d $file1 ] ; then
    echo "폴더임"
else
    echo "[fail ] 파일또는 디렉토리가아님"
    exit 1
fi
