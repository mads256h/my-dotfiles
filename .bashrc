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
export PATH="$HOME/.local/bin:/home/mads/.local/share/npm/bin:$PATH"
export EDITOR='nvim'
export TERMINAL='st'
export BROWSER='librewolf'


# Configure directories
source "$HOME/.config/bash/dirs.sh"

# Move dotfiles to .config
source "$XDG_CONFIG_HOME/bash/move.sh"

# Program settings
source "$XDG_CONFIG_HOME/bash/progs.sh"

# Aliases
source "$XDG_CONFIG_HOME/bash/alias.sh"

# xrdb environment variables
#eval $(xrdb-env)


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1="\[$(tput sgr0)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 3)\]\W\[$(tput setaf 1)\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

# Start X automagically on tty1
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx > "$XDG_CACHE_HOME/startx.log" 2>&1
fi
