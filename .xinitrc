#!/bin/sh

xset m 0 0 &
xinput --set-prop "Laview Technology Mionix Naos 7000" "libinput Accel Speed" -1 &
xrdb "$XDG_CONFIG_HOME"/X11/Xresources &
/usr/lib/kdeconnectd &
wp &
mail-up &
dunst &
picom &
i3
