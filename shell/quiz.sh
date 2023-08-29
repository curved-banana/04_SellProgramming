#!/bin/bash
#강의 평가
#1.강의 환경 (0~100)
#2 강의내용  (0~100)
#3 강의 지원 (0~100)

. /root/shell/functions.sh

#Variable Definition
Result=/root/shell/result.txt
> $Result
MESSFI=/root/sheel/MESSAGE.txt
NUM=0


#Code Definition
for i in $(seq 3); 
do
    NUM=$i
    MESS=$(sed -n "$i"p $MESSFI)
    EvalLect "$NUM" "$MESS"
done

#1.강의 환경 (0~100)
MES1="강의환경 만족?"
NUM=1
EvalLect "$NUM" "$MES1"


#2 강의내용  (0~100)
NUM=2
MES2="강의내용 만족?"

EvalLect "$NUM" "$MES2"


#3 강의 지원 (0~100)
MES3="강의지원 만족?"
NUM=3
EvalLect "$NUM" "$MES3"


read ; cat $Result