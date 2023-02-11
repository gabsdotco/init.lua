-- Adding dots to indent lines
vim.cmd("set list")
vim.cmd("set lcs+=space:.")

-- Editor transparent colors
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")
vim.cmd("highlight Normal ctermbg=none")
vim.cmd("highlight NonText ctermbg=none")

vim.cmd("highlight clear LineNr")
vim.cmd("highlight clear SignColumn")

-- Numbers Gutter
vim.cmd("highlight LineNr guifg=#2b2b2b")
vim.cmd("highlight CursorLineNr guibg=NONE guifg=#5b5b5b gui=bold")
vim.cmd("highlight CursorLine guibg=NONE")

-- Tabline colors
vim.cmd("highlight TabLineSel guibg=#ffffff guifg=#0A0A0A")
vim.cmd("highlight TabLine guibg=NONE guifg=#ffffff")
vim.cmd("highlight TabLineFill guibg=NONE guifg=NONE")

-- Statusline background
vim.cmd("highlight StatusLine guibg=#0A0A0A")

-- Split colors
vim.cmd("highlight VertSplit guibg=#0A0A0A guifg=#0A0A0A")

-- Command line colors
vim.cmd("highlight Pmenu guibg=#0A0A0A guifg=#444444")
vim.cmd("highlight PmenuSel guibg=#cccccc guifg=#0A0A0A")

-- Fold colors
vim.cmd("highlight Folded guibg=#0A0A0A guifg=#3b3b3b")
