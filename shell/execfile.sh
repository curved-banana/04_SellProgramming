#!/bin/bash

echo -n "실행할 프로그램은: "
read CMD

#echo $CMD

if [ -x "$CMD" ] ; then
     $CMD
else
    echo "[FAIL ]실행권한 없다이기"
    exit 1
fi