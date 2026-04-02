return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
  
    opts = {
      keymap = { preset = 'default', },
      appearance = { nerd_font_variant = 'mono' },
      completion = { documentation = { auto_show = true } },
  
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },
  -- help ins-completion

  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = { 'clangd', 'marksman' , 'bash' }
      
      vim.lsp.enable('clangd')
      vim.lsp.enable('marksman')
      vim.lsp.enable('bash')
      vim.diagnostic.config({ signs = false })
    end,
  },
  
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "marksman",
        "bash",
      },
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end
  },

}
