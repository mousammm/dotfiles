return {
  {
    "tpope/vim-fugitive",
    "junegunn/fzf.vim",
    "junegunn/fzf",
  },

  {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<leader>so", "<cmd>topleft Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {
      }
    end,
  },

  {
    dir = "~/projects/nvim_md_prev/",
    name = "nvim_md_prev",
    config = function ()
      require('nvim_md_prev')
    end
  },
}
