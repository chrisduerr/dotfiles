#!/bin/bash

# Video bitrate used for both recording and transcoding
output="/home/undeadleech/pictures/tmp"
framerate="60"
bitrate="10M"

# If recording is in process, cancel it to start transcoding
running=$(ps ax | grep ffmpeg | wc -l)
if [[ $running != 1 ]]; then
    pkill ffmpeg;
    exit 0;
fi

# Get the area for recording from slop
slop=$(slop)
rectangle=$(echo $slop | sed 's/\([^+]*\).*/\1/')
offset=$(echo $slop | sed 's/[^+]*+\(.*\)/\1/')
xoffset=$(echo $offset | sed 's/\([^+]*\).*/\1/')
yoffset=$(echo $offset | sed 's/[^+]*+\(.*\)/\1/')

# Record the video as mkv and transcode it to webm once recording is finished
ffmpeg -y -f x11grab -s $rectangle -framerate $framerate -i :0.0+$xoffset,$yoffset -b:v $bitrate $output.mkv
ffmpeg -y -i $output.mkv -b:v $bitrate $output.webm
