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
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
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
        "lua_ls",
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

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT', },
            diagnostics = { globals = { 'vim' }, },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false, },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      vim.diagnostic.config({
        signs = false,
        virtual_text = true,
        underline = true,
     })
    end,
  },
}
