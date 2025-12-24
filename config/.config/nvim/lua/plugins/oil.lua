return
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    lazy = false,
    config = function()
        require("oil").setup({
            view_options = {
              show_hidden = true
            }
        })
    end,
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  }
