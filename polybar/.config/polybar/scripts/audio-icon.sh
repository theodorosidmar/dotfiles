#!/bin/bash

CURRENT=$(pactl get-default-sink)

if [[ "$CURRENT" == *"hdmi"* ]]; then
  echo ""
else
  echo ""
fi
