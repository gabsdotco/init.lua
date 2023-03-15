vim.g.mapleader = " "

-- Basic Remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Scrolling Remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Telescope Remaps
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup {
  defaults = {
    layout_config = {
      width = 0.9,
      height = 0.9,
      prompt_position = "bottom",
      preview_width = 0.5
    },
    border = {},
    prompt_prefix = " • ",
    selection_caret = " • ",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    winblend = 0,
    mappings = {
      i = {
        ['<leader>v'] = actions.select_vertical,
      },
      n = {
        ['<leader>v'] = actions.select_vertical,
      },
    },
    file_ignore_patterns = {
      "node_modules",
      ".git",
      "dist",
      "build",
      ".next"
    },
  },
  extensions = {
    file_browser = {
      grouped = true,
      hijack_netrw = true,
      initial_mode = "normal",
    },
  },
}

telescope.load_extension('file_browser')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-t>', builtin.buffers, {})
vim.keymap.set('n', '<C-g>', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<C-w>', ":Telescope file_browser initial_mode=normal path=%:p:h select_buffer=true<CR>", {})

-- LSP Remaps
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

-- Copilot Remaps
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Tabs Remaps
vim.keymap.set('n', '<C-h>', ':tabprevious<CR>', {})
vim.keymap.set('n', '<C-l>', ':tabnext<CR>', {})
vim.keymap.set('n', '<C-q>', ':tabclose<CR>', {})

-- Split Remaps
vim.keymap.set('n', '<S-q>', '<C-w>c', {})

vim.keymap.set('n', '<S-h>', '<C-w>h', {})
vim.keymap.set('n', '<S-l>', '<C-w>l', {})

-- Diagnostic Remaps
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, {}) -- Open line diagnostics popup

-- Clipboard Remaps
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Force don't use arrows
vim.keymap.set('n', '<Up>', '<Nop>', {})
vim.keymap.set('n', '<Down>', '<Nop>', {})
vim.keymap.set('n', '<Left>', '<Nop>', {})
vim.keymap.set('n', '<Right>', '<Nop>', {})
