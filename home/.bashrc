HISTCONTROL=ignoreboth		# no duplicate line 
shopt -s histappend 		# append to the history file
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize 		# window size check | update lines and columns 

# ALIAS
alias l='ls -l --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lSah --group-directories-first --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# GCC colored warnings 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ENV VARIABLES
export EDITOR=vim
export VISUAL=vim

set -o vi	# enables vi in bash prompt

# export PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\n\$ "
export PS1="\[\e[34m\]\w\[\e[0m\]\n\$ "

# tips
# C^R  to reverse search history 
