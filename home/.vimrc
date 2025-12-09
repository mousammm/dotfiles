" set beep off
set noerrorbells
set visualbell
set t_vb=  " Disable visual bell in terminalo

" Default tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" Makefile-specific settings
" autocmd FileType Makefile setlocal noexpandtab
function! SetMakefileSettings()
    if expand('%:t') =~? '^Makefile' || expand('%:e') ==? 'mk'
        setlocal noexpandtab
        setlocal tabstop=8
    endif
endfunction
 
autocmd BufNewFile,BufRead * call SetMakefileSettings()

set nocompatible 		" use vi improved 
set clipboard=unnamedplus 	" use sys clipboard
syntax on			
set autoindent
set number
set mouse=a

" set highlight 
set hlsearch
set incsearch
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
nnoremap <leader><Esc> :nohlsearch<CR>

" quickfix for shell output
command! -nargs=+ Run :cexpr system(<q-args>) | copen
nnoremap <leader>r :Run 

set wildmenu

source ~/.vim-plug/vinegar/vinegar.vim
source ~/.vim-plug/comment.vim
source ~/.vim-plug/pacun.vim
