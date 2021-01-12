#!/bin/sh

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xset m 0 0 &
xinput --set-prop "Laview Technology Mionix Naos 7000" "libinput Accel Speed" -1 &
xrdb "$XDG_CONFIG_HOME"/X11/Xresources &
/usr/lib/kdeconnectd &
wp &
mail-up &
dunst &
picom &
i3
