# History Configuration
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
export HISTFILE="/home/$USER/.cache/.zsh_history"

zshaddhistory() {
    emulate -L zsh
    [[ $1:t != (ls|cd|exit|pwd)* ]]
}

# Terminal Control
stty -ixon

# Vi Mode Configuration
bindkey -v
export KEYTIMEOUT=1

# Map Ctrl+J and Ctrl+K to history search (Moved below 'bindkey -v' so they aren't overwritten)
bindkey -M viins '^J' history-incremental-search-forward
bindkey -M viins '^K' history-incremental-search-backward

# Aliases
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'
alias vim='nvim'
alias kkk='kitten icat --align left'
alias d='dirs -v'

# Environment Variables
export TERM=xterm-256color
export EDITOR=vim
export LESS="--incsearch"
export MANPAGER="vim -M +MANPAGER -"

setopt PROMPT_SUBST                                

GB() {
  local ref=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [[ -n $ref ]]; then
    echo " ($ref)"
  fi
}

export PROMPT='[%n@%m %c]$(GB) 
> '
