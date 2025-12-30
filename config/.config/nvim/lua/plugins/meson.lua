return {
  "williamboman/mason.nvim",
  -- dependencies = {
  --   "williamboman/mason-lspconfig.nvim",  -- Recommended
  --   "neovim/nvim-lspconfig",              -- Recommended
  -- },
  opts = {
    ensure_installed = {
      "clangd",  -- Auto-install clangd
      "clang-format",  -- Optional: C/C++ formatter
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    
    -- Auto-install clangd on startup
    local mr = require("mason-registry")
    local function ensure_clangd()
      local clangd = mr.get_package("clangd")
      if not clangd:is_installed() then
        clangd:install()
        print("Installing clangd...")
      end
    end
    
    ensure_clangd()
  end
}
