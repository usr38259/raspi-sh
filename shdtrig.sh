#!/bin/bash

echo "20" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio20/direction
echo "1" > /sys/class/gpio/gpio20/value

echo "21" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio21/direction

while (true)
do
	if [ $(</sys/class/gpio/gpio21/value) == 1 ]
	then
		echo "20" > /sys/class/gpio/unexport
		echo "21" > /sys/class/gpio/unexport
		echo System is being halted by a GPIO action.
		shutdown now "System halted by a GPIO action."
		break
	fi
	sleep 2.5
done
