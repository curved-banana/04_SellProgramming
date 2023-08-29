#!/bin/bash

#crontba -e
# 0 8 * * 1-5 check_file >/var/log/file.log 2>&1

#cat /root/bin/check_file_list.txt
# /etc/passwd
# /etc/group
# /etc/hosts

# 1)파일 초기화
# 2) 백업 or 비교작업 -> reslut_0824.txt
# 3) 결과점검 -> 메일전송



# 1)파일 초기화
RESULT=reslut_$(date +%m%d).txt
> $RESULT

# 2) 백업 or 비교작업 -> reslut_0824.txt
TMP1=/tmp/tmp1
FILE_LIST=/root/bin/file_list.txt
BACKUPDIR=/backup
[ ! -d /backup ] && mkdir -p /backup
for FILE1 in $(cat $FILE_LIST)
do
    FILEPATH=$(dirname $FILE1)
    FILENAME=$(basename $FILE1)
    BACKUPFILE=$BACKUPDIR/$FILENAME.OLD
    if [ -f $BACKUPFILE ]; then
        diff $FILE1 $BACKUPFILE > $TMP1
        if [ -s $TMP1 ] ; then
            echo "[Warn] $FILE1 " >> $RESULT
            cp -p $FILE1 $BACKUPFILE
        else
            echo "[OK] $FILE1" >> $RESULT
        fi

    else
        cp -p $FILE1 $BACKUPFILE
    fi
done

# 3) 결과점검 -> 메일전송
EAMAIL=root
grep -w WARN $RESULT >/dev/null 2>&1
if [ $? -eq 0 ]; then
    mailx -s "[WARN ] 중요한 파일 내용 변경" $EAMAIL <$RESULT
else
    mailx -s "[ok] 안전" $EAMAIL < $RESULT
fi


