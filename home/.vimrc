set t_Co=256
set background=dark

" Force proper cursor colors
highlight Cursor guifg=black guibg=white
highlight lCursor guifg=black guibg=white
highlight CursorIM guifg=black guibg=white
" set beep off
set noerrorbells
set visualbell
set t_vb=  " Disable visual bell in terminalo

" Default tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" autocmd FileType Makefile setlocal noexpandtab
function! Makefilesettings()
    if expand('%:t') =~? '^Makefile' || expand('%:e') ==? 'mk'
        setlocal noexpandtab
        setlocal tabstop=8
    endif
endfunction
 
autocmd BufNewFile,BufRead * call Makefilesettings()

set nocompatible 		" use vi improved 
set clipboard=unnamedplus 	" use sys clipboard
syntax on			
set autoindent
set number
set mouse=a

" set highlight 
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <leader><Esc> :nohlsearch<CR>

" search and replace
nnoremap <leader>sr :%s/<C-r><C-w>//g<Left><Left>

" quickfix for shell output
command! -nargs=+ Run :cexpr system(<q-args>) | copen
nnoremap <leader>r :Run 

set wildmenu

source ~/.vim-plug/vinegar/vinegar.vim
source ~/.vim-plug/comment.vim
source ~/.vim-plug/pacum.vim
source ~/.vim-plug/cfix.vim

nnoremap <C-w>h <C-w>h
nnoremap <C-w>j <C-w>j
nnoremap <C-w>k <C-w>k
nnoremap <C-w>l <C-w>l

" Window splitting
nnoremap <C-w>v :vsplit<CR>
nnoremap <C-w>s :split<CR>
nnoremap <C-w>n :new<CR>
nnoremap <C-w>q :close<CR>

" Quickfix window specific
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>
