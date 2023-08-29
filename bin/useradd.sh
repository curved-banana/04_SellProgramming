#!/bin/bash

USERLIST=user.list
cat $USERLIST | while read UNAME UPASS
do
    echo "$USERLIST : $UPASS"
    echo $UPASS | passwd --stdin $UNAME
done