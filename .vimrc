" ----------------
" OPTIONS
" ----------------
set t_Co=256
set nocompatible " remove vi support

filetype plugin on
set omnifunc=syntaxcomplete
set expandtab " tab to spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent

set incsearch
set hlsearch
set ignorecase
set smartcase

set wildmenu
set wildoptions=pum

syntax on
" colorscheme habamax
colorscheme unokai
highlight Normal ctermbg=NONE

" ----------------
" KEYMAPS
" ----------------

nnoremap - :Ex<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap ; :
nnoremap <TAB> gt
