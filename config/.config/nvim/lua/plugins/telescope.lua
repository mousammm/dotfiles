return 
{
    'nvim-telescope/telescope.nvim', tag = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        require('telescope').setup{
          defaults = {
            -- ...
          },
          pickers = {
            find_files = {
              theme = "ivy",
            }
          },
          extensions = {
            -- ...
          }
        }
    end,
}
