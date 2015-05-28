#!/bin/bash

echo "Starting To Record Temperature"
timestamp=`date +%F_%H-%M-%S`
echo "Temperature Log - $(date)"
>/home/pi/logs/temperature_log_$timestamp.txt

echo $temp "Temperature Of Pi/Celsius" >>/home/pi/logs/temperature_log_$timestamp.txt


for i in {1..30}
do
    temp=`/opt/vc/bin/vcgencmd measure_temp`
    temp=${temp:5:16}
    echo $temp >>/home/pi/logs/temperature_log_$timestamp.txt
    echo "Recorded Temperature #$i"
    tail -1 /home/pi/logs/temperature_log_$timestamp.txt
    sleep 10
done
echo "Finished Recording Temperature!"
