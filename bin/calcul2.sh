#!/bin/bash

Error(){
    echo -n " 졸못된 번호입력"
    exit 1
}

echo -n "Enter A : "
read A

echo -n "Enter Operator: "
read C

echo -n "Enter B : "
read B




case $C in
    '+') echo "$A + $B = $(expr $A + $B)" ;;
    '-') echo "$A - $B = $(expr $A - $B)" ;;
    '*') echo "$A * $B = $(expr $A \* $B)" ;;
    '/') echo "$A / $B = $(expr $A / $B)" ;;
    *) echo "wrong"
esac