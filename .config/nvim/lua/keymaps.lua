vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.keymap.set

map('n', ';',  ':' )
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '-',  ':Ex<CR>' )

-- lsp
map('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })
map('n', '<leader>sq', '<cmd>lua vim.diagnostic.setloclist()<cr>', { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>ss',  '<cmd>LspClangdSwitchSourceHeader<CR>' )

-- fzf maps
map('n', '<leader>ff', '<cmd>Files<CR>')
map('n', '<leader>fg', '<cmd>Rg<CR>')
map('n', '<leader>fb', '<cmd>Buffers<CR>')
map('n', '<leader>fd', '<cmd>Files ~/dotfiles<CR>')
