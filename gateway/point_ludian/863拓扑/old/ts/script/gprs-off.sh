#!/bin/sh

if [ -c "/dev/ttyUSB3" ]; then
	#turn off gprs,pull-down gpio109
	echo 1 > /sys/class/gpio/gpio109/value
	sleep 1

	#pull-up gpio
	echo 0 > /sys/class/gpio/gpio109/value
	#sleep 3~12
	sleep 5

	#turn off power
	echo 1 > /sys/class/gpio/gpio18/value
	sleep 1

	pkill pppd

	echo GPRS OFF
else
	echo GPRS Already OFF
fi
