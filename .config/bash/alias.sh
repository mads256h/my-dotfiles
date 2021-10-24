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
alias cv='nvim $HOME/.config/nvim/init.lua'

# i3 configuration shortcut
alias ci3='nvim $HOME/.config/i3/config'

# xinitrc configuration shortcut
alias cx='nvim $HOME/.xinitrc'

# connect to server on home network
alias cs='ssh server-mads.lan; test "$?" -eq 255 && (ssh 192.168.1.150; test "$?" -eq 255 && ssh home.madsmogensen.dk)'

# connect to desktop
alias cde='ssh desktop-mads.router.lan'

# connect to laptop
alias cla='ssh laptop-mads.router.lan'

# connect to kali vm
alias ck='ssh -X -p 26666 mads@127.0.0.1'

# dotfiles bare git repo shortcut
alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# filemanager (vifm)
alias fm='vifmrun'

# set signing key in git repo to main key
alias gsp='git config user.signingKey 75C8BC5DCCE7257DA133C6CECCD33BA72D54F208'

# connect to sshfs when on home network
alias s='sshfs -o idmap=user -C mads@server-mads.lan:/mnt/share ~/mnt/ || sshfs -o idmap=user -C mads@home.madsmogensen.dk:/mnt/share ~/mnt/'

# unmount sshfs
alias us='fusermount3 -u ~/mnt'

# upload file
alias u='uploadcb'

# youtube-dl highest quality video
alias yt='youtube-dl -f bestvideo+bestaudio --add-metadata --embed-subs --all-subs'

# youtube-dl archive mode
alias yta='yt --download-archive .archive'

# youtube-dl highest quality mp3
alias ytmp3='youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata'

# get weather from Aalborg
alias we='curl https://wttr.in/Aalborg'
