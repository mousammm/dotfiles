
Arch linux 
base-devel,libx11
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --with-x --enable-gui=no
make 
sudo make install
/usr/local/bin/vim --version | grep clipboard
