--------------
-- OPTIONS
--------------
vim.wo.number = false
vim.o.relativenumber = false

vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.clipboard = 'unnamedplus'

vim.o.wrap = false
vim.o.linebreak = true
vim.o.autoindent = true
vim.o.showmode = false
vim.o.cmdheight = 1
vim.o.laststatus=0
vim.opt.guicursor:append("i-ci-ve:block")

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.o.inccommand = 'split'
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd('colorscheme habamax')
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })

--------------
--- NVIM API STUFF
--------------
vim.api.nvim_create_user_command('RIB', function()
    vim.ui.input({ prompt = 'Shell command: ' }, function(input)
        if not input or input == "" then return end
        vim.cmd('new')

        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buf })
        vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = buf })
        vim.api.nvim_set_option_value('swapfile', false, { buf = buf })
        
        vim.cmd('r !' .. input)
        vim.cmd('1delete _')
    end)
end, {})

--------------
-- KEYMAPS
--------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.keymap.set

map('n', ';',  ':' )
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '-',  ':Ex<CR>' )
map('n', ':', ':<C-f>i')
map('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostics list' })
map('n', '<leader>sq', '<cmd>lua vim.diagnostic.setloclist()<cr>', { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>ss',  '<cmd>LspClangdSwitchSourceHeader<CR>' )
map('n', '<leader>bb', '<cmd>RIB<CR>' )

--------------
-- PLUGINS
--------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- lspinstall
local lsp_ITS = {
  "clangd",
  "ols",
}

require("lazy").setup({

  {
    "mousammm/billa.nvim",
    config = function()
      require("billa").setup()
    end
  },

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
      ensure_installed = lsp_ITS,
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

      for _, server in ipairs(lsp_ITS) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      vim.diagnostic.config({
        signs = false,
        virtual_text = false,
        underline = true,
     })
    end,
  },

  -- NEXT PLUGIN HERE

  }, {
  defaults = {
    lazy = false,
  },
})
