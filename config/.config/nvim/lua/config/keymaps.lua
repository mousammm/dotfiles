local map = vim.keymap.set


map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

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
