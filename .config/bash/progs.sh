#!/bin/bash

# Disable less history file
export LESSHISTFILE=-

# Make java programs look nicer
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -DsDjdk.gtk.version=3"

# Make qt use theme configured by qt5ct
export QT_QPA_PLATFORMTHEME="qt5ct"
