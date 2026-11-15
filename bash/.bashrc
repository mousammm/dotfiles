export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE
shopt -s histappend
export HISTCONTROL=ignoreboth
export HISTFILE="/home/$USER/.cache/.bash_history"
stty -ixon
shopt -s checkwinsize

alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'
alias vim='nvim'
alias kkk='kitten icat --align left'

export EDITOR=vim
export LESS="--incsearch"

set -o vi
set keyseq-timeout 0
export PS1="\w \n "
export PATH="$HOME/opt/i386-elf-7.5.0-Linux-x86_64/bin:$PATH"
export PATH="$HOME/opt/fasm:$PATH"
