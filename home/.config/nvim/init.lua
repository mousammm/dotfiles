require("config.lazy")

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

---------------------------------------------------------
-- KEYMAPS
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>aa',  'ggVG' )

--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>b', function()
    require('telescope.builtin').builtin()
end, { desc = 'Telescope: Show builtin pickers' })

vim.keymap.set('n', '<leader>fd', function()
    require('telescope.builtin').find_files({
      cwd = "~/dotfiles",
      hidden = true,
    })
end, { desc = 'Find dotfiles' })
