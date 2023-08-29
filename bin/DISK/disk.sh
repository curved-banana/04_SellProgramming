#!/bin/bash
. /root/bin/DISK/func.sh
while true
do
    WorkMenu
    echo -n "작업을 선택하세요: "
    read WORKCHOICE

    case $WORKCHOICE in
        1) echo "[INFO] 출력 " 
           PrintOutput 
           ;;
        2) echo "[INFO] 파티션 작업" 
            # parted /dev/sdb mklabel msdos | gpt
            # parted /dev/sdb mkpart 2048s 100%
            DiskWork
            ;;
        3) echo "[INFO] 파일 시스템 작업" 
            FSWork ;;
            #mkfs -t xfs|ext4 /dev/sdb1
            
        4) echo "[INFO] 마운트 시스템 작업"
            #mkdir -p /oracle
            #mount /dev/sdb1 /oracle
            #echo "/dev/sdb1   /oracle  xfs  defaults  0 2" >> /etc/fstab
            FSMOUNT ;;

        5) echo "[INFO] 종료  작업" 
            break ;;
            
        *) echo "잘못된 번호 입력 "
    esac

#디스크 작업 절차
#(ㄱ) 파티션 작업(스크립트로 작업시=> parted CMD )
#  *디스크 유무
#  *파티션 작업(/dev/sdb1)
   
#(ㄴ) 파일시스템 작업(mkfs CMD)
#  *파일시스템 종류 (ext4|xfs)
#  *파일시스템 작업(xfs)
#(ㄷ) 마운트 작업(mount CMD , /etc/fstab에 추가)
# * 마운트 포인터
# * 마운트 작업 (/dev/sdb1 -> /oracle)

done
