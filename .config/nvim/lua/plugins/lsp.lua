return {

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
    },

    config = function()
      vim.lsp.config("clangd", {})
      vim.lsp.enable("clangd")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
            autotrigger = true,
          })
        end,
      })

      vim.diagnostic.config({ 
        signs = false,
        virtual_text = false,
        underline = true,
     })
    end,
  },
  
}
