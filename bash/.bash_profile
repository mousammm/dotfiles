if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

source ~/opt/emsdk/emsdk_env.sh > /dev/null 2>&1

export PATH="$HOME/bin/:$PATH"
export PATH="$HOME/opt/i386-elf-7.5.0-Linux-x86_64/bin:$PATH"

