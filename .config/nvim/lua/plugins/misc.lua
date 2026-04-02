return 
{
  { 'christoomey/vim-tmux-navigator', },
  { 'tpope/vim-sleuth', },
  { 'tpope/vim-fugitive', },
  { 'tpope/vim-rhubarb', },

  {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end,
  },

  -- { 
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl", opts = {},
  -- },

}

