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
        vim.api.nvim_set_option_value('filetype', 'lua', { buf = buf })
        
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

  -- LSP setup
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

  -- scratch buffer for eval shell/lua
  {
    "mousammm/billa.nvim",
    config = function()
      require("billa").setup({
        splash_screen = false,
      })
    end
  },

  -- fuzzy finder
  {
    'dmtrKovalenko/fff',
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    opts = { debug = { enabled = true, show_scores = true, }, },
    lazy = false,
    keys = {
      { "ff", function() require('fff').find_files() end, desc = 'FFFind files' },
      { "fg", function() require('fff').live_grep() end, desc = 'LiFFFe grep' },
      { "fz",
        function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end,
        desc = 'Live fffuzy grep',
      },
      { "fw",
        function() require('fff').live_grep_under_cursor() end,
        mode = { 'n', 'x' },
        desc = 'Search current word / selection',
      },
    },
    config = function()
      require('fff').setup({
        prompt = '> ',
        title = 'findInFiles',
        prompt_vim_mode = true,
        follow_symlinks = true,
        layout = {
          border = none,
          show_scrollbar = false,
        }, 
      })
    end,
  },

  -- NEXT PLUGIN HERE

  }, {
  defaults = {
    lazy = false,
  },
})

-- FFF colors
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = 'NONE' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = 'NONE' })

hl = {
  winhl = {
    prompt  = 'Normal:Pmenu,FloatBorder:FloatBorder',
    list    = 'Normal:NormalFloat,FloatBorder:FloatBorder',
    preview = 'Normal:NormalFloat,FloatBorder:FloatBorder',
  },
}
