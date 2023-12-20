#!/bin/bash

# Disable less history file
export LESSHISTFILE=-

# Make java programs look nicer
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djdk.gtk.version=3 -Djdk.downloader.home=$XDG_DATA_HOME/jdks"

# Make qt use theme configured by qt5ct
export QT_QPA_PLATFORMTHEME="qt5ct"

# Hostname
export HOSTNAME=$(hostname)

# Stop dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# dotnet root
export DOTNET_ROOT="/opt/dotnet"

# Use nvidia libva driver
[ "$HOSTNAME" = "DESKTOP-MADS" ] && export LIBVA_DRIVER_NAME=nvidia
