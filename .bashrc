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

# connect to server on home network
alias cs='ssh server-mads.lan'

# connect to tserver on other network
alias csp='ssh home.madsmogensen.dk'

# dotfiles bare git repo shortcut
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# set signing key in git repo to main key
alias gsp='git config user.signingKey 75C8BC5DCCE7257DA133C6CECCD33BA72D54F208'

# connect to sshfs when on home network
alias s='sshfs -o idmap=user -C mads@server-mads.lan:/mnt/share ~/mnt/'

# connect to sshfs on other network
alias sp='sshfs -o idmap=user -C mads@home.madsmogensen.dk:/mnt/share ~/mnt/'

# unmount sshfs
alias us='fusermount3 -u ~/mnt'

# youtube-dl highest quality video
alias yt='youtube-dl -f bestvideo+bestaudio --add-metadata --embed-subs --all-subs'

# youtube-dl highest quality mp3
alias ytmp3='youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata'

# get weather from Aalborg
alias we='curl https://wttr.in/Aalborg'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
