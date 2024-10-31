-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})

		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

-- Setup remaps and options before loading plugins
require("config.set")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("nohlsearch")
end, {})

-- Setup lazy.nvim
require("lazy").setup({
	checker = { enabled = true },
	spec = { { import = "plugins" } },
})
