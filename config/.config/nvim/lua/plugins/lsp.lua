return {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local servers = { 'clangd', 'marksman' }
    
    -- for _, server in ipairs(servers) do
    --   require('lspconfig')[server].setup({ capabilities = capabilities })
    -- end
    require('lspconfig').clangd.setup({
      cmd = { "clangd", "--background-index", "--compile-commands-dir=." },
      filetypes = { "c", "cpp", "objc", "objcpp" },
    })
    -- vim.lsp.enable('clangd')
    vim.lsp.enable('marksman')

  end,
}
-- help lspconfig-all
-- heko lsp.txt
