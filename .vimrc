" ----------------
" OPTIONS
" ----------------
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
"colorscheme wildcharm " light blue
"colorscheme pablo " greeen

" ----------------
" KEYMAPS
" ----------------

let mapleader = " "
nnoremap - :Ex<CR>
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap ; :
nnoremap <leader>aa <Esc>ggVGy
nnoremap <leader>cc i/*  */<Esc>bhi
set clipboard^=unnamedplus

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
let lspOpts = #{autoHighlightDiags: v:false}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = [#{
	\	  name: 'clang',
	\	  filetype: ['c', 'cpp'],
	\	  path: '/usr/local/bin/clangd',
	\	  args: ['--background-index']
	\ }]
autocmd User LspSetup call LspAddServer(lspServers)
autocmd User LspSetup call LspOptionsSet(#{
    \   autoHighlightDiags: v:true,
    \   showDiagWithSign: v:false,
    \   showDiagWithVirtualText: v:false,
    \   snippetSupport: v:false,
    \ })

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
" lsp warning + errors in location list
nnoremap <leader>sq :LspDiag show<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>
nnoremap <leader>so :LspOutline<CR>
nnoremap <leader>sd :LspDocumentSymbol<CR>
nnoremap <leader>ss :LspSwitchSourceHeader<CR>
" LspPeekDefinition # open the function defination in a preview
" LspPeekDeclaration # open the function defination in a preview
