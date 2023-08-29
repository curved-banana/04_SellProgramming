#!/bin/bash
# ./filezie.sh /etc/hosts

if [ $# -ne 1 ] ; then
    echo "Usage : $0 filename"
    exit 2
fi

FILE1=$1

#echo $FILE1

FILESIZE=$(wc -c < $FILE1)
#echo $FILESIZE

if [ $FILESIZE -ge 5120 ] ; then
    echo "[ok] big file($FILESIZE ) bytes"
else
    echo "[ok] small file($FILESIZE ) bytes"
fi