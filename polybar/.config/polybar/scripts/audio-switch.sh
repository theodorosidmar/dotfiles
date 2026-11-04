#!/bin/bash

# Monitor speakers (BenQ EX2510 on DP-2). The NVIDIA card exposes one output per
# port, and this sink only exists while its card profile is active.
GPU_CARD="alsa_card.pci-0000_01_00.1"
MONITOR_PROFILE="output:hdmi-stereo-extra1"
MONITOR="alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1"
INEARS="alsa_output.pci-0000_00_1f.3.analog-stereo"

CURRENT=$(pactl get-default-sink)

if [ "$CURRENT" = "$MONITOR" ]; then
    pactl set-default-sink "$INEARS"
else
    pactl set-card-profile "$GPU_CARD" "$MONITOR_PROFILE"
    pactl set-default-sink "$MONITOR"
fi
