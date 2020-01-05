#!/bin/bash

echo ""
echo "Polybar is starting"

# kill
killall -q polybar

# set env variables
DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# wait
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# start
polybar main &

echo ""
echo "Polybar is launched."
