require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
    "json",
  },

  sync_install = false,
  auto_install = true,

  ident = {
    enable = true,
  },

  highlight = {
    enable = true,
  },
}

