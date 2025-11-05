local theme = require("custom.theme")

-- Basic Remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Scrolling Remaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Split Remaps
vim.keymap.set("n", "<S-q>", function()
	vim.cmd("bd")
	vim.cmd("bprev")
end, {})

vim.keymap.set("n", "<S-h>", "<C-w>h", {})
vim.keymap.set("n", "<S-l>", "<C-w>l", {})
vim.keymap.set("n", "<leader>j", "<C-w>j", {})
vim.keymap.set("n", "<leader>k", "<C-w>k", {})

vim.keymap.set("n", "<leader>.", ":vertical resize +15<CR>", {})
vim.keymap.set("n", "<leader>,", ":vertical resize -15<CR>", {})
vim.keymap.set("n", "<leader>=", "<C-w>=", {})

-- Clipboard Remaps
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Force don't use arrows
vim.keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>", {})
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>", {})
vim.keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>", {})
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>", {})

-- Undo/Redo Remaps
vim.keymap.set("n", "U", "<C-r>")

-- Clear search highlights
vim.keymap.set("n", "<leader><space>", function()
	vim.cmd("nohlsearch")
end, {})
