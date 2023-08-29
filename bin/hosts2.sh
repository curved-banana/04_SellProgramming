#!/bin/bash


#192.168.10.10  linux10.example.com  linux10
#192.168.10.11  linux11.example.com  linux11
#192.168.10.12  linux12.example.com  linux12
#....
#192.168.10.50  linux50.example.com  linux50

#HOSTS=/etc/hosts

HOSTS=hosts
#> $HOSTS
NET=192.168.10


IP1=$(ip addr show ens33 | grep 'inet ' | awk '{print $2}' | awk -F/ '{print $1}' | awk -F. '{print $4}')
cat << EOF >> $HOSTS
#
# linux Server List
#
EOF

for i in $(seq 10 50)
do
    [ $i = $IP1 ] && continue
    echo "$NET.$i  linux$i.example.com  linux$i" >> $HOSTS
done