#!/bin/sh
xrandr \
  --output DP-0    --mode 1920x1080 --rate 240  --pos 0x0 --rotate normal --primary\
  --output DP-2 --mode 1920x1080 --rate 144 --pos 1920x0 --rotate normal
