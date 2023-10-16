require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    position = "right"
  },
  filesystem = {
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
