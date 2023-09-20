#!/bin/bash

numlockx
xrdb "$XDG_CONFIG_HOME"/X11/Xresources
eval $(xrdb-env)
[ "$HOSTNAME" = "DESKTOP-MADS" ] && /usr/lib/kdeconnectd &
transmission-daemon -f &
wp &
dunst &
[ "$HOSTNAME" = "laptop-mads" ] && picom -b
exec i3
