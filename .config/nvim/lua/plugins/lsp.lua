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

  {
    "williamboman/mason.nvim",
    opts = {
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "clangd",
        "marksman",
        -- "bashls",
      },
      automatic_installation = true,
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end
  },

  { 
    "neovim/nvim-lspconfig",
    dependencies = { 
      "saghen/blink.cmp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')
      
      vim.lsp.enable('clangd')
      vim.lsp.enable('marksman')
      -- vim.lsp.enable('bashls')

      vim.diagnostic.config({ 
        signs = false,
        virtual_text = true,
        underline = true,
     })
    end,
  },
  
}
