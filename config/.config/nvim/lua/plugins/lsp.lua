return {
  "neovim/nvim-lspconfig",
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    require('lspconfig').clangd.setup({ capabilities = capabilities })
  end
}
-- help lspconfig-all
-- heko lsp.txt
