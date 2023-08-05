local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

-- Telescope Setup
telescope.setup {
  defaults = {
    initial_mode = 'insert',
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        width = 0.8,
        height = 0.7,
        preview_cutoff = 120,
        prompt_position = "top",
      },
      width = 0.5,
      height = 0.7,
      preview_cutoff = 120,
      prompt_position = "top",
    },
    prompt_prefix = " : ",
    selection_caret = "❯ ",
    border = {},
    borderchars = { " " },
    path_display = { "truncate" },
    winblend = 0,
    color_devicons = true,
    mappings = {
      i = {
        ['<leader>v'] = actions.select_vertical,
        ['<leader>h'] = actions.select_horizontal,
      },
      n = {
        ['<leader>v'] = actions.select_vertical,
        ['<leader>h'] = actions.select_horizontal,
        ["q"] = require("telescope.actions").close
      },
    },
    file_ignore_patterns = {
      "node_modules",
      "dist",
      "build",
      ".next"
    },
  },
  extensions = {
    file_browser = {
      grouped = true,
      hijack_netrw = true,
      hidden = true,
      initial_mode = "normal",
      file_ignore_patterns = {
        "node_modules",
      },
    },
  },
}

telescope.load_extension('file_browser')

-- Telescope Remaps
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-t>', builtin.buffers, {})
vim.keymap.set('n', '<C-g>', builtin.git_files, {})
vim.keymap.set('n', '<C-s>', builtin.git_status, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-e>', ":Telescope file_browser initial_mode=normal path=%:p:h select_buffer=true<CR>", {})

-- Telescope Buffer Fuzzy Find Remap
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find({
    prompt_title = "Current Buffer Search",
    selection_caret = "❯ ",
    initial_mode = "insert",
    previewer = false,
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        width = 0.8,
        height = 0.7,
        preview_cutoff = 120,
      },
      width = 0.5,
      height = 0.7,
      preview_cutoff = 120,
    },
  })
end, {})
