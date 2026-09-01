" ----------------
" OPTIONS
" ----------------
set t_Co=256
set nocompatible
set noerrorbells
set visualbell t_vb=

filetype plugin on
set omnifunc=syntaxcomplete
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartindent

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

nnoremap - :Ex<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap ; :
nnoremap <TAB> gt

" move selected lines
xnoremap <tab> :sil! m '>+1<CR>gv
xnoremap <s-tab> :sil! m '<-2<CR>gv
