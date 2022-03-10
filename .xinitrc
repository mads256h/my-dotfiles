#!/bin/sh

xset m 0 0 &
xinput --set-prop "Laview Technology Mionix Naos 7000" "libinput Accel Speed" -1 &
xrdb "$XDG_CONFIG_HOME"/X11/Xresources
eval $(xrdb-env)
[ "$HOSTNAME" = "desktop-mads" ] && /usr/lib/kdeconnectd &
transmission-daemon -f &
wp &
dunst &
[ "$HOSTNAME" = "laptop-mads" ] && picom -b
i3
