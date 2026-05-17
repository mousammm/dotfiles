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
}
