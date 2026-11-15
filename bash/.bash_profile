if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

export PATH="$HOME/bin/:$PATH"
# export PATH="$HOME/thirdParty/odin-linux-amd64-nightly+2026-06-08/:$PATH"
. "$HOME/.cargo/env"
export PATH="$HOME/opt/i386-elf-7.5.0-Linux-x86_64/bin:$PATH"
