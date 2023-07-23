require("noirbuddy").setup({
  preset = 'minimal',
  styles = {
    italic = true,
    bold = true,
    underline = true,
    undercurl = true,
  },
  colors = {
    background = "#000000",
    primary = '#333333',
    secondary = '#777777',
    noir_0 = '#f1f1f1',
    noir_1 = '#e2e2e2',
    noir_2 = '#e2e2e2',
    noir_3 = '#a7a7a7',
    noir_4 = '#555555',
    noir_5 = '#444444',
    noir_6 = '#383838',
    noir_7 = '#333333',
    noir_8 = '#222222',
    noir_9 = '#111111',
  },
})

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
vim.cmd("highlight TabLineSel guibg=#ffffff guifg=#000000")
vim.cmd("highlight TabLine guibg=NONE guifg=#ffffff")
vim.cmd("highlight TabLineFill guibg=NONE guifg=NONE")

-- Statusline background
vim.cmd("highlight StatusLine guibg=#000000")

-- Split colors
vim.cmd("highlight VertSplit guibg=#000000 guifg=#000000")

-- Command line colors
vim.cmd("highlight Pmenu guibg=#000000 guifg=#444444")
vim.cmd("highlight PmenuSel guibg=#cccccc guifg=#000000")
vim.cmd("highlight PmenuSbar guibg=#000000 guifg=#000000")
vim.cmd("highlight PmenuThumb guibg=#333333 guifg=#000001")

-- Fold colors
vim.cmd("highlight Folded guibg=#000000 guifg=#3b3b3b")

-- Gitsigns colors
vim.cmd("highlight GitSignsAdd guifg=#8AE234")
vim.cmd("highlight GitSignsChange guifg=#89B4FA")
vim.cmd("highlight GitSignsDelete guifg=#EB6F92")

-- Telescope colors
vim.cmd("highlight TelescopeBorder guibg=#0a0a0a guifg=#0a0a0a")
vim.cmd("highlight TelescopeNormal guibg=#0a0a0a")
vim.cmd("highlight TelescopeSelection guibg=#434242 guifg=#e2e2e2")

vim.cmd("highlight TelescopePromptPrefix guibg=#1B1A17 guifg=#a7a7a7")
vim.cmd("highlight TelescopePromptNormal guibg=#1B1A17 guifg=#a7a7a7")
vim.cmd("highlight TelescopePromptTitle guibg=#e2e2e2 guifg=#0a0a0a")
vim.cmd("highlight TelescopePromptBorder guibg=#1B1A17 guifg=#1B1A17")
vim.cmd("highlight TelescopePromptCounter guibg=#1B1A17 guifg=#a7a7a7")

vim.cmd("highlight TelescopeResultsNormal guibg=#111111 guifg=#e2e2e2")
vim.cmd("highlight TelescopeResultsTitle guibg=#111111 guifg=#111111")
vim.cmd("highlight TelescopeResultsBorder guibg=#111111 guifg=#111111")

vim.cmd("highlight TelescopePreviewNormal guibg=#111111 guifg=#e2e2e2")
vim.cmd("highlight TelescopePreviewTitle guibg=#e2e2e2 guifg=#0a0a0a")
vim.cmd("highlight TelescopePreviewBorder guibg=#111111 guifg=#111111")
