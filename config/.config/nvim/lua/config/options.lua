vim.g.have_nerd_font = true
-- vim.wo.number = true
-- vim.o.relativenumber = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'  
-- vim.o.cursorlineopt ='both' -- to enable cursorline!

vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard

vim.o.wrap = false
vim.o.linebreak = true
vim.o.autoindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmode = false
vim.o.cmdheight = 1
vim.o.laststatus=0
vim.opt.guicursor:append("i-ci-ve:block")

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
