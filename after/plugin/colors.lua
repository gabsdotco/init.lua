require("noirbuddy").setup({
  preset = 'minimal',
  styles = {
    italic = true,
    bold = true,
    underline = true,
    undercurl = true,
  },
  colors = {
    background = "#101010",
    -- primary = '#333333',
    -- secondary = '#666666',
    -- primary = '#fefa67',
    primary = '#fefa67',
    secondary = '#a978f6',
    tertiary = '#f2ff8a',
    noir_0 = '#f1f1f1',
    noir_1 = '#e2e2e2',
    noir_2 = '#c4c4c4',
    noir_3 = '#a7a7a7',
    noir_4 = '#555555',
    noir_5 = '#444444',
    noir_6 = '#383838',
    noir_7 = '#333333',
    noir_8 = '#222222',
    noir_9 = '#111111',
  },
})

-- Tokens colors
vim.cmd("highlight @comment guifg=#383838")

-- NeoTree Git colors
vim.cmd("highlight NeoTreeGitDirty guifg=#ff8989")
vim.cmd("highlight NeoTreeGitNew guifg=#f2ff8a")
vim.cmd("highlight NeoTreeGitStaged guifg=#89B4FA")
vim.cmd("highlight NeoTreeGitUnstaged guifg=#addef8")
vim.cmd("highlight NeoTreeGitUntracked guifg=#F0C674")
vim.cmd("highlight NeoTreeGitRenamed guifg=#f2ff8a")
vim.cmd("highlight NeoTreeGitIgnored guifg=#333333")
vim.cmd("highlight NeoTreeGitMerge guifg=#89B4FA")
vim.cmd("highlight NeoTreeGitModified guifg=#addef8")
vim.cmd("highlight NeoTreeGitDeleted guifg=#ff8989")
vim.cmd("highlight NeoTreeMessage guifg=#333333")

vim.cmd("highlight NeoTreeFileName guifg=#555555")
vim.cmd("highlight NeoTreeFolderName guifg=#666666")

vim.cmd("highlight NeoTreeFloat guibg=NONE")
vim.cmd("highlight NeoTreeFloatTitle guibg=#101010 guifg=#e2e2e2")
vim.cmd("highlight NeoTreeFloatBorder guibg=NONE guifg=#111111")
vim.cmd("highlight NeoTreeFloatNormal guibg=#111111 guifg=#e2e2e2")

-- Editor transparent colors
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")
vim.cmd("highlight Normal ctermbg=none")
vim.cmd("highlight NonText ctermbg=none")

vim.cmd("highlight clear LineNr")
vim.cmd("highlight clear SignColumn")

-- LSP colors
vim.cmd("highlight FloatBorder guibg=NONE guifg=#222222")
vim.cmd("highlight FloatShadow guibg=NONE guifg=NONE")
vim.cmd("highlight FloatShadowThrough guibg=NONE guifg=NONE")

-- Visual mode colors
vim.cmd("highlight Visual guibg=#171717 guifg=NONE")

-- Numbers Gutter
vim.cmd("highlight LineNr guifg=#2b2b2b")
vim.cmd("highlight CursorLineNr guibg=NONE guifg=#5b5b5b gui=bold")
vim.cmd("highlight CursorLine guibg=NONE")

-- Tabline colors
vim.cmd("highlight TabLineSel guibg=#ffffff guifg=#000000")
vim.cmd("highlight TabLine guibg=NONE guifg=#444444")
vim.cmd("highlight TabLineFill guibg=NONE guifg=NONE")

-- Statusline background
vim.cmd("highlight StatusLine guibg=#0a0a0a")

-- Split colors
vim.cmd("highlight VertSplit guibg=NONE guifg=#101010")

-- Command line colors
vim.cmd("highlight Pmenu guibg=#111111 guifg=#444444")
vim.cmd("highlight PmenuSel guibg=#181818 guifg=#ffffff")
vim.cmd("highlight PmenuSbar guibg=#101010 guifg=#0f0f0f")
vim.cmd("highlight PmenuThumb guibg=#181818 guifg=#0f0f0f")

-- Fold colors
vim.cmd("highlight Folded guibg=NONE guifg=#3b3b3b")

-- Gitsigns colors
vim.cmd("highlight GitSignsAdd guifg=#f2ff8a")
vim.cmd("highlight GitSignsChange guifg=#addef8")
vim.cmd("highlight GitSignsDelete guifg=#ff8989")

-- Telescope colors
vim.cmd("highlight TelescopeBorder guibg=#0c0c0c guifg=#0c0c0c")
vim.cmd("highlight TelescopeNormal guibg=#0c0c0c")
vim.cmd("highlight TelescopeSelection guibg=NONE guifg=#e2e2e2")

vim.cmd("highlight TelescopePromptPrefix guibg=#171717 guifg=#e2e2e2")
vim.cmd("highlight TelescopePromptNormal guibg=#171717 guifg=#e2e2e2")
vim.cmd("highlight TelescopePromptTitle guibg=#e2e2e2 guifg=#0f0f0f")
vim.cmd("highlight TelescopePromptBorder guibg=#171717 guifg=#111111")
vim.cmd("highlight TelescopePromptCounter guibg=#171717 guifg=#171717")

vim.cmd("highlight TelescopeResultsNormal guibg=#111111 guifg=#555555")
vim.cmd("highlight TelescopeResultsTitle guibg=#111111 guifg=#111111")
vim.cmd("highlight TelescopeResultsBorder guibg=#111111 guifg=#0a0a0a")

vim.cmd("highlight TelescopePreviewMatch guibg=#e2e2e2 guifg=#0c0c0c")

vim.cmd("highlight TelescopePreviewNormal guibg=NONE guifg=#e2e2e2")
vim.cmd("highlight TelescopePreviewTitle guibg=#e2e2e2 guifg=#0c0c0c")
vim.cmd("highlight TelescopePreviewBorder guibg=NONE guifg=#0c0c0c")
