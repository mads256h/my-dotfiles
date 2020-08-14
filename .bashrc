#
# ~/.bashrc
#
# My bashrc requires following packages (Arch Linux):
# git
# youtube-dl

# Add my scripts to the path
export PATH=$HOME/.scripts:$PATH

#
# Aliases
#

# dotfiles bare git repo shortcut
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# youtube-dl highest quality mp3
alias ytmp3='youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
