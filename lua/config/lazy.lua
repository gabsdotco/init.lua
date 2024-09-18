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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Basic Remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Scrolling Remaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Copilot Remaps
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- NvimTree Remaps
vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>", {})

-- Tabs Remaps
vim.keymap.set("n", "<C-q>", function()
	vim.cmd("bd")
	vim.cmd("bprev")
end, {})

vim.keymap.set("n", "<C-l>", function()
	vim.cmd("bnext")
end, {})

vim.keymap.set("n", "<C-h>", function()
	vim.cmd("bprev")
end, {})

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

vim.opt.nu = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.relativenumber = false
vim.opt.showtabline = 1
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.numberwidth = 1

-- Folds sets
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

-- Remove netwr menu banner
vim.g.netrw_banner = 0

vim.opt.fillchars:append({
	eob = " ",
	horiz = " ",
	horizup = " ",
	horizdown = " ",
	vert = " ",
	vertleft = " ",
	vertright = " ",
	verthoriz = " ",
})

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
