typeset -U path
path=(
  "$HOME/bin"
  "$HOME/thirdParty/zig-x86_64-linux-0.17.0-dev.892+54537285c"
  "$HOME/thirdParty/odin-linux-amd64-nightly+2026-06-08"
  $path
)
export PATH

export FZF_DEFAULT_OPTS=$'--style=minimal
  --border=none
  --info=inline
  --no-separator
  --border-label-pos=18
  --list-label-pos=17
  --header-label-pos=15
  --color=dark'

if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi
