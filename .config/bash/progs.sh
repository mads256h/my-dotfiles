#!/bin/bash

# Disable less history file
export LESSHISTFILE=-

# Make java programs look nicer
_JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -DsDjdk.gtk.version=3"
