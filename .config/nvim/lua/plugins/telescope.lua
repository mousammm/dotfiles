vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
})

-- TELESCOPE
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "%.git/",
    }
    -- ...
  },
  pickers = {
    find_files = {
      theme = "ivy",
      hidden = true,
    }
  },
  extensions = {
    -- ...
  }
}

local map = vim.keymap.set
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

map('n', '<leader>b', function()
    require('telescope.builtin').builtin()
end, { desc = 'Telescope: Show builtin pickers' })

map('n', '<leader>fd', function()
    require('telescope.builtin').find_files({
      cwd = "~/dotfiles",
      hidden = true,
    })
end, { desc = 'Find dotfiles' })
