return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "marksman",
    },
    automatic_installation = true,
  },
  config = function(_, opts)
    require("mason").setup(opts)
  end
}
