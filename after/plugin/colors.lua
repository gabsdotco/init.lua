local minimal_palette = {
  background = "#101010",
  primary = '#363636',
  secondary = '#777777',
  noir_0 = '#f1f1f1',
  noir_1 = '#e2e2e2',
  noir_2 = '#ffffff',
  noir_3 = '#a7a7a7',
  noir_4 = '#555555',
  noir_5 = '#444444',
  noir_6 = '#444444',
  noir_7 = '#333333',
  noir_8 = '#222222',
  noir_9 = '#111111',
}

local setup_editor_colors = function()
  -- Tokens colors
  vim.cmd("highlight @comment guifg=#383838")

  -- NvimTree colors
  vim.cmd("highlight NvimTreeFolderIcon guifg=#555555")
  vim.cmd("highlight NvimTreeIndentMarker guifg=#333333")
  vim.cmd("highlight NvimTreeNormal guibg=NONE guifg=#666666")
  vim.cmd("highlight NvimTreeVertSplit guibg=NONE guifg=#101010")
  
  vim.cmd("highlight NvimTreeGitDirty guifg=#addef8")
  vim.cmd("highlight NvimTreeGitNew guifg=#9bcea5")
  vim.cmd("highlight NvimTreeGitStaged guifg=#89B4FA")
  vim.cmd("highlight NvimTreeGitUnstaged guifg=#addef8")
  vim.cmd("highlight NvimTreeGitUntracked guifg=#F0C674")
  vim.cmd("highlight NvimTreeGitRenamed guifg=#f2ff8a")
  vim.cmd("highlight NvimTreeGitIgnored guifg=#444444")
  vim.cmd("highlight NvimTreeGitMerge guifg=#89B4FA")
  vim.cmd("highlight NvimTreeGitModified guifg=#addef8")
  vim.cmd("highlight NvimTreeGitDeleted guifg=#ff8989")

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
  vim.cmd("highlight CursorLine guibg=#101010")
  vim.cmd("highlight Cursor guibg=NONE")

  -- Tabline colors
  vim.cmd("highlight TabLineSel guibg=#ffffff guifg=#000000")
  vim.cmd("highlight TabLine guibg=NONE guifg=#444444")
  vim.cmd("highlight TabLineFill guibg=NONE guifg=NONE")
  vim.cmd("highlight TabLineCloseSel guibg=#ffffff guifg=#101010")
  vim.cmd("highlight TabLineClose guibg=NONE guifg=#444444")

  -- Statusline background
  vim.cmd("highlight StatusLine guibg=#0a0a0a")

  -- Split colors
  vim.cmd("highlight VertSplit guibg=NONE guifg=#101010")

  -- Command line colors
  vim.cmd("highlight Pmenu guibg=#101010 guifg=#444444")
  vim.cmd("highlight PmenuSel guibg=#181818 guifg=#ffffff")
  vim.cmd("highlight PmenuSbar guibg=#101010 guifg=#0f0f0f")
  vim.cmd("highlight PmenuThumb guibg=#181818 guifg=#0f0f0f")

  -- Fold colors
  vim.cmd("highlight Folded guibg=NONE guifg=#3b3b3b")

  -- Gitsigns colors
  vim.cmd("highlight GitSignsAdd guifg=#9bcea5")
  vim.cmd("highlight GitSignsChange guifg=#89B4FA")
  vim.cmd("highlight GitSignsDelete guifg=#ff8989")

  -- Telescope colors
  vim.cmd("highlight TelescopeBorder guibg=#0c0c0c guifg=#0c0c0c")
  vim.cmd("highlight TelescopeNormal guibg=#0c0c0c")
  vim.cmd("highlight TelescopeSelection guibg=NONE guifg=#e2e2e2")

  vim.cmd("highlight TelescopePromptPrefix guibg=#181818 guifg=#e2e2e2")
  vim.cmd("highlight TelescopePromptNormal guibg=#181818 guifg=#e2e2e2")
  vim.cmd("highlight TelescopePromptTitle guibg=#e2e2e2 guifg=#0f0f0f")
  vim.cmd("highlight TelescopePromptBorder guibg=#181818 guifg=#111111")
  vim.cmd("highlight TelescopePromptCounter guibg=#181818 guifg=#181818")

  vim.cmd("highlight TelescopeResultsNormal guibg=#101010 guifg=#555555")
  vim.cmd("highlight TelescopeResultsTitle guibg=#101010 guifg=#101010")
  vim.cmd("highlight TelescopeResultsBorder guibg=#101010 guifg=#101010")

  vim.cmd("highlight TelescopePreviewMatch guibg=#e2e2e2 guifg=#0c0c0c")

  vim.cmd("highlight TelescopePreviewNormal guibg=NONE guifg=#e2e2e2")
  vim.cmd("highlight TelescopePreviewTitle guibg=#e2e2e2 guifg=#0c0c0c")
  vim.cmd("highlight TelescopePreviewBorder guibg=NONE guifg=#0c0c0c")
end

SetupMinimalTheme = function()
  require("noirbuddy").setup({
    preset = 'minimal',
    styles = {
      italic = true,
      bold = true,
      underline = true,
      undercurl = true,
    },
    colors = minimal_palette,
  })

  setup_editor_colors()
end

SetupMinimalTheme()
