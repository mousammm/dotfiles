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

# tips
# C^R  to reverse search history 

# ALIAS
alias ls='ls --color=tty'
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'
alias gaa='git add . && git commit -a'

# ENV VARIABLES
export EDITOR=vim
export VISUAL=vim

source ~/.bash_prompt
eval "$(fzf --bash)"

# Clean dark theme with subtle colors
export LS_COLORS="\
di=0;37:ln=0;36:so=0;31:pi=0;33:\
ex=0;32:*.txt=0;37:*.md=0;37:\
*.c=0;33:*.cpp=0;33:*.h=0;33:\
*.py=0;33:*.js=0;33:*.json=0;33:\
*.jpg=0;35:*.png=0;35:*.gif=0;35:\
*.mp4=0;35:*.mp3=0;35:*.pdf=0;35:\
*.zip=1;31:*.tar=1;31:*.gz=1;31:\
*.deb=1;31:*.rpm=1;31"
