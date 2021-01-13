#!/bin/bash
#
# ~/.bashrc
#
# My bashrc requires following packages (Arch Linux):
# git
# youtube-dl
# neovim
# sshfs
# curl

#
# Exports
#

# Add my scripts to the path
export PATH="$HOME/.local/bin:$PATH"
export EDITOR='nvim'
export TERMINAL='st'
export BROWSER='chromium'


# Configure directories
source "$HOME/.config/bash/dirs.sh"

# Move dotfiles to .config
source "$XDG_CONFIG_HOME/bash/move.sh"

# Program settings
source "$XDG_CONFIG_HOME/bash/progs.sh"

# Aliases
source "$XDG_CONFIG_HOME/bash/alias.sh"

# Custom stuff
source "$XDG_CONFIG_HOME/bash/custom.sh"


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1="\[$(tput sgr0)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 3)\]\W\[$(tput setaf 1)\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
