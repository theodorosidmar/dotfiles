#!/bin/bash

echo ""
echo "Polybar is starting"

# kill
killall -q polybar

# wait
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# start
polybar default &

echo ""
echo "Polybar is launched."
