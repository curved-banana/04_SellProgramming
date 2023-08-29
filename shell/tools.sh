#!/bin/bash

cat <<EOF
================================================
(1). who        (2). date       (3). pwd
================================================
EOF

echo -n "당신선택:"
read CHOICE

#echo $CHOICE

case $CHOICE in
    1) who ;;
    2) date ;;
    3) pwd ;;
    *) echo "[error] 잘못선택"
        exit 1 ;;
esac
