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
alias gaa='git add . && git commit -a'
alias gss='git status'

# export
export EDITOR=vim
# export VISUAL=vim
export LESS="--incsearch" # incremental search
export MANPAGER="vim +MANPAGER -"

# VI mode 
set -o vi
set keyseq-timeout 0

#PROMPT
export PS1="[\w]\n> "

# fzf integration
eval "$(fzf --bash)" 
