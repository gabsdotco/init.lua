vim.g.mapleader = " "

-- Basic Remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Scrolling Remaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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
vim.keymap.set('n', '<leader>j', '<C-w>j', {})
vim.keymap.set('n', '<leader>k', '<C-w>k', {})

-- Clipboard Remaps
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Force don't use arrows
vim.keymap.set({ 'n', 'v', 'i' }, '<Up>', '<Nop>', {})
vim.keymap.set({ 'n', 'v', 'i' }, '<Down>', '<Nop>', {})
vim.keymap.set({ 'n', 'v', 'i' }, '<Left>', '<Nop>', {})
vim.keymap.set({ 'n', 'v', 'i' }, '<Right>', '<Nop>', {})
