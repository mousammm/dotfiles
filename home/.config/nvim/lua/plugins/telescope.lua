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
    end,
}
