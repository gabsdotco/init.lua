require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c",
    "lua",
    "rust",
    "javascript",
    "typescript",
    "json",
  },

  sync_install = false,
  auto_install = true,

  ident = {
    enable = true,
  },

  context_commentstring = {
    enable = true,
  },

  highlight = {
    enable = true,
  },
}

