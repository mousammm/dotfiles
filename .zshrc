HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE=~/.cache/.zsh_history
setopt appendhistory
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS

# alias
alias vim='nvim'
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'
alias gaa='git add . && git commit -a'
alias gss='git status'

# export
export EDITOR=nvim
export VISUAL=nvim
export LESS="--incsearch" # incremental search

# searching history cmd | c^r (fzf)
bindkey '^j' history-search-forward # search forward
bindkey '^k' history-search-backward # search backward

# auto-complete case sensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# VI mode 
bindkey -v
export KEYTIMEOUT=1

# PROMPT=$'[%n@%m] %2~ \n$ ' # name + directory
PROMPT=$'%2~ \n$ ' # only directory show prompt

eval "$(fzf --zsh)" # fzf integration
