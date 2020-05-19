#!/bin/bash

# Video bitrate used for both recording and transcoding
output="/home/undeadleech/pictures/tmp"

# If recording is in process, cancel it to start transcoding
running=$(ps ax | grep ffmpeg | wc -l)
if [[ $running != 1 ]]; then
    pkill ffmpeg;
    exit 0;
fi

# Get the area for recording from slop
slop=$(slop)
width=$(echo $slop | sed 's/\([^x]*\).*/\1/')
height=$(echo $slop | sed 's/[^x]*x\([^+]*\).*/\1/')
xoffset=$(echo $slop | sed 's/[^+]*+\([^+]*\).*/\1/')
yoffset=$(echo $slop | sed 's/.*+\(.*\)/\1/')

# Make sure width and height are divisible by 2
if [[ $(($width % 2)) != 0 ]]; then
    width=$(($width - 1))
fi
if [[ $(($height % 2)) != 0 ]]; then
    height=$(($height - 1))
fi

# Record lossless x264
ffmpeg \
    -f x11grab \
    -framerate 60 \
    -s ${width}x${height} \
    -i :0.0+$xoffset,$yoffset \
    -c:v libx264rgb \
    -crf 0 \
    -preset ultrafast \
    -an \
    -y \
    ${output}_lossless.mp4

# Compress x264 to decrease filesize
ffmpeg \
    -i ${output}_lossless.mp4 \
    -crf 15 \
    -c:v libx264 \
    -pix_fmt yuv420p \
    -preset veryslow \
    -movflags +faststart \
    -y \
    ${output}.mp4

# Remove massive lossless file
rm ${output}_lossless.mp4
