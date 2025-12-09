HISTCONTROL=ignoreboth		# no duplicate line 
shopt -s histappend 		# append to the history file
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize 		# window size check | update lines and columns 

export PS1="\[\e[4m\]\w\[\e[0m\]\n\$ "
set -o vi	# enables vi in bash prompt
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

# tips
# C^R  to reverse search history 

# ALIAS
alias l='ls -l --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lSah --group-directories-first --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# sound 
alias vu="pactl set-sink-volume @DEFAULT_SINK@ +5%"
alias vd="pactl set-sink-volume @DEFAULT_SINK@ -5%"
alias vm="pactl set-sink-mute @DEFAULT_SINK@ toggle"

# ENV VARIABLES
export EDITOR=vim
export VISUAL=vim

export GOON="$HOME/dotfiles/scripts/goon.sh"
alias goon="source \"\$GOON\""
# or if it should be an executable script:
alias goon="\"\$GOON\""

export KITTY_CP="$HOME/dotfiles/scripts/kittyC.sh"
alias kk="source \"\$KITTY_CP\""
# or if it should be an executable script:
alias kk="\"\$KITTY_CP\""

