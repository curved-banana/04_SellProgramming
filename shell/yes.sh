#!/bin/bash

echo -n "니 선택은 yes|no : "
read YESNO

case $YESNO in
    yes|YES|Yes|Y|y) echo "[yes]" ;;
    no|NO|n|N) echo "[no]" ;;
    *) "[error]"
        exit 1 ;;
esac