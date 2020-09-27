#!/bin/sh

SCRIPT_LOCATION=$(dirname "$0")

# Retreives the keepassxc database from outside my home network
URL=home.madsmogensen.dk "${SCRIPT_LOCATION}/_update-passwords.sh"
