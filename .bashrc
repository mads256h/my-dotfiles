#!/bin/bash
#
# ~/.bashrc
#
# My bashrc requires following packages (Arch Linux):
# git
# youtube-dl
# neovim

#
# Exports
#

# Add my scripts to the path
export PATH="$HOME/.scripts:$PATH"
export EDITOR='nvim'
export TERMINAL='konsole'
export BROWSER='chromium'


#
# Aliases
#

# bashrc configuration shortcut
alias cb='nvim $HOME/.bashrc'

# bash_profile configuration shortcut
alias cbp='nvim $HOME/.bash_profile'

# neovim configuration shortcut
alias cv='nvim $HOME/.config/nvim/*.vim'

# dotfiles bare git repo shortcut
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# youtube-dl highest quality video
alias yt='youtube-dl -f best --add-metadata'

# youtube-dl highest quality mp3
alias ytmp3='youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
