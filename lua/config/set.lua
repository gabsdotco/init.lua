vim.opt.nu = false
vim.opt.statuscolumn = "%s%l%r " -- %s: status, %l: line, %r: relative line
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.smartindent = true
vim.opt.scrolloff = 24
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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
