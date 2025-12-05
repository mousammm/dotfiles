#
# ~/.bash_profile
#


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

[[ -f ~/.bashrc ]] && . ~/.bashrc
