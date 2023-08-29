#!/bin/bash

for i in $(seq 1 5)
do
    for k in $(seq $(expr 5 - $i) -1 1)
    do
        echo -n " "
        
    done

    #왼쪽 별
    for j in $(seq 1 $i)
    do
        echo -n "*"
    done

    #오른쪽별
    for h in $(seq 1 $(expr $i - 1))
    do
        echo -n "*"
    done

    echo
done

for i in $(seq 1 5)
do
    #아래공백개수
    for k in $(seq 1 $i)
    do
        echo -n " "
        
    done 
    #아래 왼쪽별개수
    for j in $(seq $(expr 5 - $i) -1 1)
    do  
        echo -n "*"
    done

    for h in $(seq 1 $(expr 4 - $i))
    do
        echo -n "*"
    done

    echo

  
done