require("neo-tree").setup({
  close_if_last_window = true,
  auto_clean_after_session_restore = true,
  sources = {
    "filesystem",
    "git_status",
  },
  window = {
    position = "left"
  },
  default_component_configs = {
    git_status = {
      symbols = {
        -- Change type
        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "", -- this can only be used in the git_status source
        renamed   = "󰁕", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "󰄱",
        staged    = "",
        conflict  = "",
      }
    },
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_gitignored = true,
    },
    window = {
      mappings = {
        ['H'] = "none",
        ['h'] = "toggle_hidden",
      }
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
  },
  buffers = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
  }
})


vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

-- Remaps
vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", {})
