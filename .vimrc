" ----------------
" OPTIONS
" ----------------
set t_Co=256
set nocompatible
set noerrorbells
set visualbell t_vb=

filetype plugin on
set omnifunc=syntaxcomplete
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set incsearch
set hlsearch
set ignorecase
set smartcase
set nowrap 

set wildmenu
set wildoptions=pum

syntax on
colorscheme habamax
"colorscheme unokai
highlight Normal ctermbg=NONE

" ----------------
" KEYMAPS
" ----------------

nmap - :Ex<CR>
nmap <Esc><Esc> :nohlsearch<CR>
nmap ; :
