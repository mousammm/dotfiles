shopt -s checkwinsize  # win col and height
shopt -s histappend
HISTCONTROL=ignoreboth		# no duplicate line 
HISTSIZE=5000
HISTFILESIZE=10000
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

set -o vi	# enables vi in bash prompt
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

# C^R  to reverse search history 

# ALIAS
alias vim='nvim'
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'
alias gaa='git add . && git commit -a'

# ENV VARIABLES
export EDITOR=nvim
export VISUAL=nvim

source ~/.bash_prompt
eval "$(fzf --bash)"
