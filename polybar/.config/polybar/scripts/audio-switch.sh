#!/bin/bash

HDMI="alsa_output.pci-0000_01_00.1.hdmi-stereo"
INEARS="alsa_output.pci-0000_00_1f.3.analog-stereo"

CURRENT=$(pactl get-default-sink)

if [ "$CURRENT" = "$HDMI" ]; then
    pactl set-default-sink "$INEARS"
else
    pactl set-default-sink "$HDMI"
fi
