return {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    local servers = { 'clangd', 'marksman' }
    
    for _, server in ipairs(servers) do
      require('lspconfig')[server].setup({ capabilities = capabilities })
    end
  end
}
-- help lspconfig-all
-- heko lsp.txt
