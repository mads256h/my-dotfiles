#!/bin/bash
#
# ~/.bash_profile
#
[ -z "$GITHUB_WORKSPACE" ] || export HOME="$GITHUB_WORKSPACE"

[[ -f "$HOME"/.bashrc ]] && . "$HOME"/.bashrc
