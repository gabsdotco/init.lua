vim.g.mapleader = " "

-- Basic Remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Netrw Remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Scrolling Remaps
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Telescope Remaps
local builtin = require('telescope.builtin')
local telescope = require('telescope')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-t>', builtin.buffers, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      "dist",
      "build",
      ".next"
    },
  }
}

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
vim.keymap.set('n', '<C-n>', ':tabnew ', {})

-- Split Remaps
vim.keymap.set('n', '<S-q>', '<C-w>c', {})
vim.keymap.set('n', '<S-n>', ':vsplit ', {})

-- Vertical Split Remaps
vim.keymap.set('n', '<S-h>', '<C-w>h', {})
vim.keymap.set('n', '<S-l>', '<C-w>l', {})

-- Horizonal Split Remaps
vim.keymap.set('n', '<S-j>', '<C-w>j', {})
vim.keymap.set('n', '<S-k>', '<C-w>k', {})

-- Diagnostic Remaps
vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, {}) -- Open line diagnostics popup

-- Force don't use arrows
vim.keymap.set('n', '<Up>', '<Nop>', {})
vim.keymap.set('n', '<Down>', '<Nop>', {})
vim.keymap.set('n', '<Left>', '<Nop>', {})
vim.keymap.set('n', '<Right>', '<Nop>', {})
