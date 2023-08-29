#!/bin/bash

Error(){
    echo -n " 졸못된 번호입력"
    
}

echo -n "Enter A : "
read A

echo -n "Enter B : "
read B

cat << EOF
==============================================
 (1). +    (2). -    (3). *    (4). /
==============================================
EOF

echo -n "Enter choice: "
read C

case $C in
    1) echo "$A + $B = $(expr $A + $B)" ;;
    2) echo "$A - $B = $(expr $A - $B)" ;;
    3) echo "$A * $B = $(expr $A \* $B)" ;;
    4) echo "$A / $B = $(expr $A / $B)" ;;
    *) echo "wrong"
esac