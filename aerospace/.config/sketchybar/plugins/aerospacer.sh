#!/usr/bin/env sh

echo "called with $1"
echo "$FOCUSED_WORKSPACE"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon="󰮯"
elif [ "$1" -lt "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME icon=""
else
    sketchybar --set $NAME icon=""
fi
