#!/bin/bash

#ENV2.sh : 환경설정
#* $HOME/.bashrc

# (1) $HOME/.bashrc 파일 설정 절차
#BASHRC=$HOME/.bashrc
BASHRC=/root/bin/bashrc.txt

cat << EOF > $BASHRC
# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#
# Sfecific configuration
#
export PS1='\[\e[34;1m\][\u@\h\[\e[33;1m\] \w]\$ \[\e[m\]'
#

#
# DNS Server Alias
#
alias named.conf='vi /etc/named.conf'
alias named.rfc1912.zones='vi /etc/named.rfc1912.zones'
alias DNS='cd /var/named'
alias dnslog='tail -f /var/log/messages'
alias df='df -T -h'

#
#VScode Alias
#
alias code='code --user-data-dir ~/vscode --no-sandbox'
alias vscode='code'


#
#Shell Script
#
export PATH=$PATH:$HOME/shell
alias bbb='chmod 700 /root/shell/*.sh'
#alias aaa='echo "#!/bin/bash" > /root/shell/ $1'
EOF

alias fwcmd