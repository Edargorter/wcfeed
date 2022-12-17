#!/bin/bash

directory=$1
filename="capture"
ext="jpg"

count=0
mod=$((5*12*30))

sudo python -m http.server 80 --directory $directory > ${directory}/server.log 2>&1 &

while :
do
	fswebcam -r 640-480 ${directory}/${filename}.$ext
	vcgencmd measure_temp | cut -d "=" -f 2 | rev | cut -c 3- | rev > ${directory}/temp.txt
	sleep 5
	count=$((($count + 1) % $mod))
	if [ "$count" -eq "0" ]; then
		tail -n 100 ${directory}/server.log > ${directory}/server.log;
	fi
done
