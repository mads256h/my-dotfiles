#!/bin/bash

#
# Aliases
#

# bashrc configuration shortcut
alias cb='nvim $HOME/.bashrc'

# bash alias shortcut
alias cba='nvim $XDG_CONFIG_HOME/bash/alias.sh'

# bash dirs shortcut
alias cbd='nvim $XDG_CONFIG_HOME/bash/dirs.sh'

# bash_profile configuration shortcut
alias cbp='nvim $HOME/.bash_profile'

# neovim configuration shortcut
alias cv='nvim $HOME/.config/nvim/*.vim'

# i3 configuration shortcut
alias ci3='nvim $HOME/.config/i3/config'

# xinitrc configuration shortcut
alias cx='nvim $HOME/.xinitrc'

# connect to server on home network
alias cs='ssh server-mads.lan'

# connect to tserver on other network
alias csp='ssh home.madsmogensen.dk'

# dotfiles bare git repo shortcut
alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# filemanager (vifm)
alias fm='vifmrun'

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
