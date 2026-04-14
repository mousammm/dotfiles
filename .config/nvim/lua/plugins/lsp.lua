vim.pack.add({
    'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/saghen/blink.cmp',

    'https://github.com/williamboman/mason.nvim',
    'https://github.com/neovim/nvim-lspconfig',
})

vim.defer_fn(function()

    require("mason").setup({
      ensure_installed = {
        "clangd",
        "marksman",
        "bash",
        "lua-ls",
      },
      automatic_installation = true,
    })
    
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    
    vim.lsp.enable('clangd')
    vim.lsp.enable('marksman')
    vim.lsp.enable('bash')
    vim.lsp.enable('lua-ls')
    
    -- DIAGONSTICS
    vim.diagnostic.config({ 
        signs = false,
        virtual_text = true,
        underline = true,
    })
      
    -- BLINK.cmp
    require('blink.cmp').setup({
        keymap = { preset = 'default' },
        appearance = { nerd_font_variant = 'mono' },
        completion = { documentation = { auto_show = true } },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        fuzzy = {
          implementation = "lua"
        },
    })

end, 0)
