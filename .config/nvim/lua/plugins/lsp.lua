return {

  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = "rafamadriz/friendly-snippets",
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

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
        "bashls",
        "marksman",
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
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.lsp.config("clangd", { capabilities = capabilities })
      vim.lsp.enable("clangd")
      vim.lsp.config("bashls", { capabilities = capabilities })
      vim.lsp.enable("bashls")
      vim.lsp.config("marksman", { capabilities = capabilities })
      vim.lsp.enable("marksman")

      vim.diagnostic.config({ 
        signs = false,
        virtual_text = true,
        underline = true,
     })
    end,
  },
  
}
