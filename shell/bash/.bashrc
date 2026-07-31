export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE
shopt -s histappend
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:cd:exit:pwd"
export HISTTIMEFORMAT="%F %T "
export HISTFILE="/home/$USER/.cache/.bash_history"

stty -ixon
shopt -s checkwinsize # update lines and colums on resize

# alias
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'
alias vim='nvim'
alias kkk='kitten icat --align left'

# export
export TERM=xterm-256color
export EDITOR=vim
export LESS="--incsearch"
export MANPAGER="vim -M +MANPAGER -"
# export MANPAGER="nvim +Man!"

# VI mode 
set -o vi
set keyseq-timeout 0

#PROMPT
GB() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[\u@\h \W]\$(GB) \n "
