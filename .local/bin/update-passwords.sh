#!/bin/sh

SCRIPT_LOCATION="$(dirname "$0")"

# Retreives the keepassxc database from withing my home network
URL="server-mads.lan" "$SCRIPT_LOCATION/_update-passwords.sh"
