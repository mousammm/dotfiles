export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE
shopt -s histappend
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:cd:exit:pwd"
export HISTTIMEFORMAT="%F %T "
export HISTFILE="/home/$USER/.cache/.bash_history"

stty -ixon
shopt -s autocd # auto cd
shopt -s checkwinsize # update lines and colums on resize

# alias
alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lSah --group-directories-first'
alias vim='nvim'
alias kkk='kitten icat --align left'

# export
export TERM=xterm-256color
export EDITOR=vim
export LESS="--incsearch"
export MANPAGER="vim -M +MANPAGER -"
# export MANPAGER="nvim +Man!"

# VI mode 
set -o vi
set keyseq-timeout 0

#PROMPT
GB() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[\u@\h \W]\$(GB) \n "

# fzf integration
export FZF_DEFAULT_OPTS=$'--style=minimal
  --border=none
  --info=inline
  --no-separator
  --border-label-pos=18
  --list-label-pos=17
  --header-label-pos=15
  --color=dark'
eval "$(fzf --bash)" 

# zig 
export PATH="$HOME/thirdParty/zig-x86_64-linux-0.17.0-dev.892+54537285c/:$PATH"
export PATH="$HOME/thirdParty/odin-linux-amd64-nightly+2026-06-08/:$PATH"

# Ruby Gem path configurations
export GEM_HOME="$(ruby -e 'print Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
