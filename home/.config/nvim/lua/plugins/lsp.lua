return {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local servers = { 'clangd', 'marksman' }
    
    vim.lsp.enable('clangd')
    vim.lsp.enable('marksman')
    vim.diagnostic.config({ signs = false })
  end,
}
-- help lspconfig-all
-- heko lsp.txt
