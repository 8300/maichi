#!/bin/sh 
/ts/script/at_u 3 AT+CFUN=4,0 
sleep 3 
/ts/script/at_u 3 AT+CFUN=1,0 
sleep 3 
pppd /dev/ttyUSB3 115200 nocrtscts modem debug nodetach usepeerdns \
user cmnet password 12345 \
noipdefault defaultroute 0.0.0.0:0.0.0.0 ipcp-accept-local noccp persist connect '/sbin/chat -s -v -f /ts/script/4g'