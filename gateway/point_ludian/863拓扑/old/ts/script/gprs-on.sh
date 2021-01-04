#!/bin/sh
cnt=1
if [ ! -c "/dev/ttyUSB3" ]; then

	#turn on power
	echo 0 > /sys/class/gpio/gpio18/value
	sleep 2

	#turn on gprs,pull-down gpio
	echo 1 > /sys/class/gpio/gpio109/value
	sleep 1

	#pull-up gpio
	echo 0 > /sys/class/gpio/gpio109/value

	while [ $cnt -le "15" ]
	do
		if [  -c "/dev/ttyUSB3" ]; then
			echo 
			echo GPRS ON
			break
		else
			sleep 1
			cnt=$((${cnt}+1))
		fi
	done
else
	sleep 1
	echo GPRS Already open
fi

if [ -c "/dev/ttyUSB3" ]; then
	sleep 1
	#/program/dial-on.sh &
else
	echo GPRS OPEN TIMEOUT
fi
