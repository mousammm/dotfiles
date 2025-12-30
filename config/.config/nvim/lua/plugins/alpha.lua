return {
  'goolord/alpha-nvim',
  config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
      local startify = require'alpha.themes.startify'
      startify.section.header.val = {}
  end
};
