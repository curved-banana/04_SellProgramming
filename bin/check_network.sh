#!/bin/bash
#   네트워크 점검 스크립트
# 1) ping 192.168.10.2 내부통신
# 2) ping 8.8.8.8  외부통신
# 3) ping www.google.com 이름으로 통신

. /root/bin/func.sh
# 1) ping 192.168.10.2 내부통신
IP1=192.168.10.2
IP2=8.8.8.8
IP3=www.google.com


print_info "1) #ping $IP1"
ping -c 1 -W 1 $IP1 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good " [  OK  ] Local Network Connection "

else
    print_error "[ FAIL ] Local Network Connection"
    cat << EOF
    (ㄱ) # ifconfig , # ip addr
    (ㄴ) VMware >  Edit > Virtual Network Editor > VMnet0
    (ㄷ) VMware >  Edit > Virtual Network Editor > VMnet8
        *Network number
        *Gateway IP address
    (ㄹ) services.msc > VMware* 서비스 동작
    
EOF
fi

# 2) ping 8.8.8.8  외부통신
print_info "2) #ping $IP2"
ping -c 1 -W 1 $IP2 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good " [  OK  ] Externeral Network Connection "

else
    print_error "[ FAIL ] EXterneral Network Connection"
    cat << EOF
    (ㄱ) # ip route (# netstat -nr , # route -n)
EOF
fi
# 3) ping www.google.com 이름으로 통신
print_info "3) #ping $IP3"
#ping -c 1 -W 1 $IP2 >/dev/null 2>&1
dig +noanswer +timeout=1 $IP3 >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    print_good " [  OK  ] DNS Client Configuration "

else
    print_error "[ FAIL ] DNS Client Configuration "
    cat << EOF
    (ㄱ) # cat /etc/reslov.conf
EOF
fi