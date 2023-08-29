#!/bin/bash

for NAME in $(egrep -v '^#|^S' /etc/vsftpd/ftpusers)
do
    echo "$NAME"
done