#!/bin/bash
#webserver.sh httpd|nginx

. /root/bin/func.sh

[ $# -ne 1 ] && WebServerUsage
WEBTYPE=$1
case $WEBTYPE in
    httpd) httpd.sh ;; 
    nginx) nginx.sh ;;
    *)  WebServerUsage ;;

esac
