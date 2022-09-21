#!/bin/sh
xrandr \
  --output DP-5    --mode 1920x1080 --rate 60  --pos    0x0 --rotate normal\
  --output DVI-I-1 --mode 1920x1080 --rate 144 --pos 1920x0 --rotate normal\
  --output DP-2    --mode 1920x1080 --rate 240 --pos 3840x0 --rotate normal --primary\
  --output HDMI-0  --mode 1920x1080 --rate 60  --pos 5760x0 --rotate normal\
