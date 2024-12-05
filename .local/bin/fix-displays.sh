#!/bin/sh
xrandr \
  --output DP-0    --mode 1920x1080 --rate 240  --pos 0x0 --rotate normal --primary\
  --output HDMI-0 --mode 1920x1080 --rate 60 --pos 1920x0 --rotate normal
