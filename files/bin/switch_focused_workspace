#!/bin/bash

INPUT_NUM=$(($1 - 1))
CURRENT_WS=$(i3-msg -t get_workspaces | sed 's/.*"num":\([^,]*\)[^{]*"focused":true.*/\1/')
OUTPUTS_NUM=$(xrandr | grep " connected" | wc -l)
BASE_WS=$((($CURRENT_WS - 1) % $OUTPUTS_NUM + 1))
NEW_WS=$(($INPUT_NUM * $OUTPUTS_NUM + $BASE_WS))
i3-msg workspace "$NEW_WS"
