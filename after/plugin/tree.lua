require("neo-tree").setup({
  window = {
    position = "right"
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    },
    window = {
      mappings = {
        ['H'] = "none",
        ['h'] = "toggle_hidden",
      }
    },
    follow_current_file = {
      enabled = true,
      leave_dirs_open = true,
    },
  }
})

vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

-- Remaps
vim.keymap.set("n", "<C-t>", ":Neotree toggle<CR>", {})
