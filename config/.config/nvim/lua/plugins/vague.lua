return
{
  "vague-theme/vague.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other plugins
  config = function()
    require("vague").setup({
       -- transparent = true, -- don't set background
       transparent = false, -- don't set background
    })
    vim.cmd("colorscheme vague")
  end
}
