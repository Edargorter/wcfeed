#!/bin/bash

directory=$(pwd)
filename="capture"
ext="jpg"

img=0
mod=5

while :
do
	fswebcam -r 640-480 ${directory}/${filename}.$ext
	sleep 5
	#img=$((($img + 1) % $mod))
done
