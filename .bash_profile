#!/bin/bash
#
# ~/.bash_profile
#
[ -z "$GITHUB_WORKSPACE" ] || export HOME="$GITHUB_WORKSPACE"

# shellcheck source=./.bashrc
[[ -f "$HOME"/.bashrc ]] && . "$HOME"/.bashrc
