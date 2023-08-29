#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "Usage : $0 <pattern>  <filename>"
    exit 1
fi
PATTERN=$1
FILE1=$2

grep  -q $PATTERN $FILE1
if [ $? -eq 0 ] ; then
    echo "[ok ] 패턴찾았다"

else
    echo "[fail] 못찾았다노"
fi

