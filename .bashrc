export HISTSIZE=100000        # How many lines to keep in memory
export HISTFILESIZE=$HISTSIZE # How many lines to keep on disk
shopt -s histappend
export HISTCONTROL=ignoreboth # ignore duplicates, cmd with space
export HISTIGNORE="ls:cd:exit:pwd" # ignore it
export HISTTIMEFORMAT="%F %T " # save history with timestamp
export HISTFILE="/home/$USER/.cache/.bash_history"

stty -ixon # C-s and C-q disable
shopt -s autocd # cd without cd
shopt -s checkwinsize # update lines and colums on resize

# alias
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'

# export
export TERM=xterm-256color
export EDITOR=vim
export LESS="--incsearch" # incremental search
export MANPAGER="vim -M +MANPAGER -"

# VI mode 
set -o vi
set keyseq-timeout 0

#PROMPT
GB() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[\u@\h \W]\$(GB) \n "

# fzf integration
export FZF_DEFAULT_OPTS=$'--style=minimal
  --border=none
  --info=inline
  --no-separator
  --border-label-pos=18
  --list-label-pos=17
  --header-label-pos=15
  --color=dark'
eval "$(fzf --bash)" 
