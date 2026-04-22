" ----------------
" OPTIONS
" ----------------

set nocompatible " remove vi support

filetype plugin indent on
set expandtab " tab to spaces
set shiftwidth=4 " >> or <<
set softtabstop=4 " when use tabs
set tabstop=4 " when use tabs
set smartindent

set wildmenu " autocompletion after tab
syntax on
colorscheme habamax

" ----------------
" KEYMAPS
" ----------------

let mapleader = " "
nnoremap - :Ex<CR>

" ----------------
" PLUGINS
" ----------------
let s:plugin_dir = expand('~/.vim/plugins')

function! s:ensure(repo)
    let name = split(a:repo, '/')[-1]
    let path = s:plugin_dir . '/' . name

    if !isdirectory(path)
        if !isdirectory(s:plugin_dir)
            call mkdir(s:plugin_dir, 'p')
        endif
        execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
    endif

    execute 'set runtimepath+=' . fnameescape(path)
endfunction

" Fuzzy Finder
call s:ensure('junegunn/fzf')
call s:ensure('junegunn/fzf.vim')
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fg :Rg<space>

" LSP
call s:ensure('yegappan/lsp')

" Clangd language server
let lspOpts = #{autoHighlightDiags: v:false}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [#{
	\	  name: 'clang',
	\	  filetype: ['c', 'cpp'],
	\	  path: '/usr/local/bin/clangd',
	\	  args: ['--background-index']
	\ }]
autocmd User LspSetup call LspAddServer(lspServers)

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap gl :LspDiag current<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>

" Set omnifunc for completion
autocmd FileType php setlocal omnifunc=lsp#complete

