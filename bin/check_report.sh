#!/bin/bash

# ex) check_report.sh U-1
if [ $# -ne 1 ] ; then
    echo "Usage : $0 {1|2|3|.....}"
    exit 1
fi
NUM=$1
NEXTNUM=$(expr $NUM + 1)


#변수지정
REPORT=report.txt

sed -n "/U-$NUM/,/U-$NEXTNUM/p" $REPORT | sed '$d'