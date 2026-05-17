" ----------------
" OPTIONS
" ----------------
set t_Co=256
set nocompatible " remove vi support

filetype plugin indent on
set expandtab " tab to spaces
set shiftwidth=2 " >> or <<
set softtabstop=2 " when use tabs
set tabstop=2 " when use tabs
set smartindent

set incsearch " move cursor on search 
set hlsearch  " highlught on search
set ignorecase " ignore case a=A
set smartcase " A!=a

set wildmenu " autocompletion after tab
set wildoptions=pum " vertical view

syntax on
colorscheme default
highlight Normal ctermbg=NONE

" ----------------
" KEYMAPS
" ----------------

nnoremap - :Ex<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap ; :
nnoremap <TAB> gt
