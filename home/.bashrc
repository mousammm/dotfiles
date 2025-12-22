shopt -s checkwinsize  # win col and height
shopt -s histappend
HISTCONTROL=ignoreboth		# no duplicate line 
HISTSIZE=5000
HISTFILESIZE=10000
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export PS1="\[\e[4m\]\w\[\e[0m\]\n\$ "
set -o vi	# enables vi in bash prompt
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

# tips
# C^R  to reverse search history 

# ALIAS
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'
alias gaa='git add . && git commit -a'


# ENV VARIABLES
export EDITOR=vim
export VISUAL=vim

export KITTY_CP="$HOME/dotfiles/scripts/kittyC.sh"
alias kk="source \"\$KITTY_CP\""
alias kk="\"\$KITTY_CP\""

eval "$(fzf --bash)"
