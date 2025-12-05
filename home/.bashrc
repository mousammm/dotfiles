HISTCONTROL=ignoreboth		# no duplicate line 
shopt -s histappend 		# append to the history file
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize 		# window size check | update lines and columns 

# GCC colored warnings 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

set -o vi	# enables vi in bash prompt

# export PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\n\$ "
export PS1="\[\e[4m\]\w\[\e[0m\]\n\$ "

# tips
# C^R  to reverse search history 
