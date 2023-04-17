vim.opt.nu = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.smartindent = true
vim.opt.scrolloff = 8
vim.opt.relativenumber = true
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.termguicolors = true

-- Folds sets
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

-- Remove netwr menu banner
vim.g.netrw_banner = 0

-- Cursor Style
vim.opt.guicursor = 'i:block'
