local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", {})
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

require("nvim-tree").setup({
  on_attach = my_on_attach,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 35,
  },
  update_focused_file = {
    enable = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      git_placement = "after",
      modified_placement = "after",
      diagnostics_placement = "after",
      web_devicons = {
        file = {
          enable = true,
          color = false,
        },
        folder = {
          enable = false,
          color = false,
        },
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "󰁕",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      }
    },
    indent_markers = {
      enable = true,
      inline_arrows = false
    }
  },
  filters = {
    git_ignored = true,
    dotfiles = true,
  },
})
