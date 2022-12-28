-- Adding dots to indent lines
vim.cmd("set list")
vim.cmd("set lcs+=space:.")

-- Editor transparent colors
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")
vim.cmd("highlight Normal ctermbg=none")
vim.cmd("highlight NonText ctermbg=none")

-- Tabline colors
vim.cmd("highlight TabLineSel guibg=#ff0088 guifg=#ffffff")
vim.cmd("highlight TabLine guibg=#000000 guifg=#ff0088")
vim.cmd("highlight TabLineFill guibg=#000000 guifg=#000000")

-- Split colors
vim.cmd("highlight VertSplit guibg=#000000 guifg=#000000")

-- Command line colors
vim.cmd("highlight Pmenu guibg=#000000 guifg=#ff0088")
vim.cmd("highlight PmenuSel guibg=#ff0088 guifg=#ffffff")
