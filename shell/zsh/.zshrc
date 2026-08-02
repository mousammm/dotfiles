export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
export HISTFILE="/home/$USER/.cache/.zsh_history"
stty -ixon

bindkey -v
export KEYTIMEOUT=1

bindkey -M viins '^J' history-incremental-search-forward
bindkey -M viins '^K' history-incremental-search-backward

alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'
alias vim='nvim'
alias kkk='kitten icat --align left'

export EDITOR=vim
export LESS="--incsearch"
export MANPAGER="vim -M +MANPAGER -"

setopt PROMPT_SUBST                                
export PROMPT='[%n@%m %c]$(GB) 
> '
