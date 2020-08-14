#
# ~/.bashrc
#

export PATH=/home/mads/.scripts:$PATH
alias dotgit='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
