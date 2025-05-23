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
export PATH="$HOME/.local/bin:/home/mads/.local/share/npm/bin:/home/mads/.local/share/JetBrains/Toolbox/scripts:$PATH"
export EDITOR='nvim'
export TERMINAL='st'
export BROWSER='librewolf'


# Configure directories
source "$HOME/.config/bash/dirs.sh"

# Move dotfiles to .config
source "$XDG_CONFIG_HOME/bash/move.sh"

# Program settings
source "$XDG_CONFIG_HOME/bash/progs.sh"


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
source "$XDG_CONFIG_HOME/bash/alias.sh"

export PS1="\[$(tput sgr0)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\u\[$(tput sgr0)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 3)\]\W\[$(tput setaf 1)\]]\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

# Set tty colors
if [ "$TERM" = "linux" ]; then
  _SEDCMD='s/.*color\(.*\): *#\(.*\)/\1 \2/p'
  for i in $(sed -n "$_SEDCMD" "${HOME}/.config/X11/Xresources" | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
    echo -en "$i"
  done
  # Set background to complete black
  echo -en '\e]P0000000'
fi



# Start X automagically on tty1
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx 2>&1 | ts "%Y-%m-%d %H:%M:%S" > "$XDG_CACHE_HOME/startx.log"
fi
