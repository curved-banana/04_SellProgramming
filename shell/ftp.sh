#!/bin/bash

#함수정의
Help(){
    cat << EOF
Commands may be abbreviated.  Commands are:

!           debug       mdir        sendport    site
$           dir         mget        put         size
account     disconnect	mkdir       pwd         status
append      exit        mls         quit        struct
EOF
}
Ls(){
    echo "Ls Functions exe"
}


#코드정의
while true
do
    echo -n "ftp> "

    read CMD

    case $CMD in    
        'help') Help;;
        'ls')   Ls ;;
        'quit') break  ;;
        *)     echo "?Invalid command" ;;
    esac

done
