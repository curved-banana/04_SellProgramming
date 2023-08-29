
WorkMenu(){
    cat << EOF
--------DISK목록 시작--------
1)출력 내용
2)파티션 작업
3)파일시스템 작업
4)마운트 작업
5)종료

EOF
}

PrintOutput(){
        cat << EOF
--------출력내용 --------
$(lsblk -o NAME,TYPE,SIZE,FSTYPE,MOUNTPOINT -p)

EOF
}

DiskWork(){
    while true
    do
        echo "[OK] 파티션 작업 중..."
        echo -n "디스크선택: /dev/sdb: "
        read DISK1
        echo -n "파티션 형식: (msdos|gpt): "
        read PARTTIONTYPE
        echo -n "파티션 용량: (50%|100%): "
        read PARTTIONSIZE
        cat << EOF
        **디스크 선택: $DISK1
        **파티션 형식: $PARTTIONTYPE
        **파티션 용량: $PARTTIONSIZE

EOF
        echo -n "위의 입력값이 맞습니까? (y/n): "
        read YESNO
        case $YESNO in
            YES|Y|yes|y)  break  ;;
            NO|N|no|n)     : ;;
            *)  echo "Y또는 N 입력"
        esac
    done
    parted $DISK1 mklabel $PARTTIONTYPE
    parted $DISK1 mkpart primary 2048s $PARTTIONSIZE
    sleep 2
    echo "[OK] 파티션 작업 완료"
}

FSWork(){
    while true
    do
        echo -n "* 파일시스템 종류 선택(xfs|ext4) : "
        read FSTYPE
        echo -n "* 작업할 파티션 이름? (ex: /dev/sdb1) : "
        read PARTTIONNAME
        cat << EOF
        **파일시스템 종류: $FSTYPE
        **파티션 이름    : $PARTTIONNAME

EOF
        echo -n "위의 입력값이 맞습니까? (y/n): "
        read YESNO
        case $YESNO in
            YES|Y|yes|y)  break  ;;
            NO|N|no|n)     : ;;
            *)  echo "Y또는 N 입력"
        esac

    done
    echo "[OK] 파일시스템 작업중..."
    mkfs -t $FSTYPE -f $PARTTIONNAME
    sleep 2
    echo "[OK] 파일시스템 작업완료"

}

FSMOUNT(){
    export FSTAB=/etc/fstab
    while true
    do
        echo -n "* 마운트 포인터 선택(ex: oracle) : "
        read MOUNTPOINT
        echo -n "* 마운트할 장치 이름? (ex: /dev/sdb1) : "
        read MOUNTPARTTIONNAME
        echo -n "* 마운트할 파일 이름? (xfs|ext4) : "
        read MOUNTFSTYPE
        cat << EOF


        **마운트포인터        : $MOUNTPOINT
        **마운트 장치 이름    : $MOUNTPARTTIONNAME
        **마운트 파일 이름    : $MOUNTFSTYPE

EOF
        echo -n "위의 입력값이 맞습니까? (y/n): "
        read YESNO
        case $YESNO in
            YES|Y|yes|y)  break  ;;
            NO|N|no|n)     : ;;
            *)  echo "Y또는 N 입력"
        esac

    done
    echo "[OK] 마운트 작업중..."
    mkdir -p $MOUNTPOINT
    
    grep -w "$MOUNTPOINT" "$FSTAB" >/dev/null 2>&1 
    [ $? -ne 0 ] && echo "$MOUNTPARTTIONNAME  $MOUNTPOINT  $MOUNTFSTYPE  defaults 0 2" >> $FSTAB
    mount -a
    sleep 2
    echo "[OK] 마운트 작업완료"
}