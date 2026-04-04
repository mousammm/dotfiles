---------------------------------------------------------
-- OPTIONS
vim.g.have_nerd_font = true
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

vim.opt.incsearch = true   -- Move cursor to the match while typing
vim.opt.hlsearch = true    -- Highlight all matches
vim.opt.ignorecase = true  -- Ignore case in search patterns
vim.opt.smartcase = true   -- Override 'ignorecase' if search contains capitals

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.o.inccommand = 'split'

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.opt.conceallevel = 0
vim.api.nvim_set_hl(0, 'HelpBar', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'HelpStar', { link = 'Normal' })

