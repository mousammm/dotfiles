vim.wo.number = false
vim.o.relativenumber = false

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'  
vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard

vim.o.wrap = false
vim.o.linebreak = true
vim.o.autoindent = true
vim.o.showmode = false
vim.o.cmdheight = 1
vim.o.laststatus=0
vim.opt.guicursor:append("i-ci-ve:block")

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.o.inccommand = 'split'
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd('colorscheme peachpuff')
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
