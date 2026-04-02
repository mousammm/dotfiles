--------------------------------------------------------
-- KEYMAPS
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

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

-- map("n", "<leader>rl", ":Lazy reload<CR>", 
--               { desc = "Reload Lazy and plugins" })
