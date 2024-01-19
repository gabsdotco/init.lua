require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
  },

  sync_install = false,
  auto_install = true,

  indent = {
    enable = true,
    disable = "yaml"
  },

  autotag = {
    enable = false,
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
