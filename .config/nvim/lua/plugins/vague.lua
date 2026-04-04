return
{
  "vague-theme/vague.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vague").setup({
      transparent = false,
      bold = false,
      italic = false,
         
      colors = {
        hint = "#936c7a",   -- folders colors
        func = "#bc96b0",
        keyword = "#787bab",
        string = "#8a739a",
        number = "#8f729e",
      },
    })
    vim.cmd("colorscheme vague")
  end
}
