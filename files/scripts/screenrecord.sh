#!/bin/bash
RUNNING=$(ps -ax | grep ffmpeg | wc -l)

if [[ $RUNNING != 1 ]]; then
    pkill ffmpeg;
    exit 0;
fi

SLOP=$(slop)
RECTANGLE=$(echo $SLOP | sed 's/\([^+]*\).*/\1/')
OFFSET=$(echo $SLOP | sed 's/[^+]*+\(.*\)/\1/')
XOFFSET=$(echo $OFFSET | sed 's/\([^+]*\).*/\1/')
YOFFSET=$(echo $OFFSET | sed 's/[^+]*+\(.*\)/\1/')
echo "Recording $RECTANGLE+$OFFSET"
ffmpeg -y -f x11grab -s $RECTANGLE -framerate 60 -i :0.0+$XOFFSET,$YOFFSET ~/pictures/tmp.mkv
ffmpeg -y -i ~/pictures/tmp.mkv ~/pictures/tmp.webm
