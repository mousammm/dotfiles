HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase # no duplicate line 
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space # ignore cmd with prefix (space)
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

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

# searching history cmd | c^r (fzf)
bindkey '^j' history-search-forward # search forward
bindkey '^k' history-search-backward # search backward

# auto-complete case sensitive
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# VI mode 
bindkey -v
export KEYTIMEOUT=1

PROMPT='%n@%m %# ' # promt 
eval "$(fzf --zsh)" # fzf integration
