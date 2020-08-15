#!/bin/bash
#
# ~/.bash_profile
#
[ -z $GITHUB_WORKSPACE ] || $HOME="$GITHUB_WORKSPACE"

[[ -f $HOME/.bashrc ]] && . $HOME/.bashrc
