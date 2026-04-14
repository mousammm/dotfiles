require("options")
require("keymaps")

-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--   local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
--   if vim.v.shell_error ~= 0 then
--     vim.api.nvim_echo({
--       { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--       { out, "WarningMsg" },
--       { "\nPress any key to exit..." },
--     }, true, {})
--     vim.fn.getchar()
--     os.exit(1)
--   end
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- require("lazy").setup("plugins", {
--   defaults = {
--     lazy = false,
--   },
-- })
--

vim.pack.add({ 'https://github.com/vague-theme/vague.nvim' })
require("vague").setup({
  transparent = false,
  bold = false,
  italic = false,
     
  colors = {
    hint = "#936c7a",   -- folders colors
    func = "#bc96b0",
    keyword = "#787bab",
    string = "#8a739a",
    number = "#8f729e",
  },
})
vim.cmd.colorscheme('vague')
