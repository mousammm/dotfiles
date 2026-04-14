vim.pack.add({
    'https://github.com/christoomey/vim-tmux-navigator',
    'https://github.com/tpope/vim-sleuth',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/tpope/vim-rhubarb',
    'https://github.com/norcalli/nvim-colorizer.lua',
    'https://github.com/lukas-reineke/indent-blankline.nvim',
})

require('colorizer').setup()
require('ibl').setup()
