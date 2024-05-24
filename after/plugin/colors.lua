local minimal_palette = {
	background = "#101010",
	primary = "#333333",
	secondary = "#ffffff",
	noir_0 = "#f1f1f1",
	noir_1 = "#e2e2e2",
	noir_2 = "#666666",
	noir_3 = "#a7a7a7",
	noir_4 = "#555555",
	noir_5 = "#444444",
	noir_6 = "#444444",
	noir_7 = "#444444",
	noir_8 = "#333333",
	noir_9 = "#111111",
}

-- #TODO: Move all this to a custom plugin
local setup_editor_colors = function()
	-- Tokens colors
	vim.cmd("highlight @variable.member guifg=#666666")

	vim.cmd("highlight @keyword guifg=#444444")
	vim.cmd("highlight @keyword.operator guifg=#555555")
	vim.cmd("highlight @keyword.return guifg=#666666")

	vim.cmd("highlight @punctuation.bracket guifg=#555555")

	vim.cmd("highlight @operator guifg=#444444")
	vim.cmd("highlight @comment guifg=#222222")
	vim.cmd("highlight @string guifg=#444444")

	vim.cmd("highlight @tag guifg=#f1f1f1")
	vim.cmd("highlight @tag.delimiter guifg=#f1f1f1")

	vim.cmd("highlight @lsp.type.parameter guifg=#777777 gui=italic")

	vim.cmd("highlight @type.qualifier guifg=#444444")

	-- Vim command line error colors
	vim.cmd("highlight ErrorMsg guifg=#444444 guibg=#ff8989")

	-- Copilot colors
	vim.cmd("highlight CopilotSuggestion guifg=#444444 gui=italic")
	vim.cmd("highlight CopilotAnnotation guifg=#666666 gui=italic")

	-- NvimTree colors
	vim.cmd("highlight NvimTreeFolderIcon guifg=#666666")
	vim.cmd("highlight NvimTreeFolderName guifg=#999999")
	vim.cmd("highlight NvimTreeIndentMarker guifg=#333333")
	vim.cmd("highlight NvimTreeNormal guibg=NONE guifg=#555555")
	vim.cmd("highlight NvimTreeVertSplit guibg=NONE guifg=NONE")

	vim.cmd("highlight NvimTreeCursorLine guibg=#101010 guifg=NONE gui=bold")

	vim.cmd("highlight NvimTreeGitDirty guifg=#f0c674")
	vim.cmd("highlight NvimTreeGitNew guifg=#9bcea5")
	vim.cmd("highlight NvimTreeGitStaged guifg=#89B4FA")
	vim.cmd("highlight NvimTreeGitUnstaged guifg=#addef8")
	vim.cmd("highlight NvimTreeGitUntracked guifg=#f0c674")
	vim.cmd("highlight NvimTreeGitRenamed guifg=#f2ff8a")
	vim.cmd("highlight NvimTreeGitIgnored guifg=#333333")
	vim.cmd("highlight NvimTreeGitMerge guifg=#A978F6")
	vim.cmd("highlight NvimTreeGitModified guifg=#addef8")
	vim.cmd("highlight NvimTreeGitDeleted guifg=#ff8989")
	vim.cmd("highlight NvimTreeWinSeparator guibg=NONE guifg=#101010")

	-- Diagnostic colors
	vim.cmd("highlight DiagnosticError guifg=#ff8989")
	vim.cmd("highlight DiagnosticWarn guifg=#f0c674")
	vim.cmd("highlight DiagnosticInfo guifg=#89B4FA")
	vim.cmd("highlight DiagnosticHint guifg=#9bcea5")

	-- Diagnostic signs colors
	vim.cmd("highlight DiagnosticSignError guifg=#ff8989")
	vim.cmd("highlight DiagnosticSignWarn guifg=#f0c674")
	vim.cmd("highlight DiagnosticSignInfo guifg=#89B4FA")
	vim.cmd("highlight DiagnosticSignHint guifg=#9bcea5")

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
	vim.cmd("highlight CursorLineNr guibg=NONE guifg=#666666 gui=bold")
	vim.cmd("highlight CursorLine guibg=#101010 guifg=NONE gui=bold")
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
	vim.cmd("highlight WinSeparator guibg=NONE guifg=#101010")

	-- Command line colors
	vim.cmd("highlight Pmenu guibg=#101010 guifg=#444444")
	vim.cmd("highlight PmenuSel guibg=#181818 guifg=#ffffff")
	vim.cmd("highlight PmenuSbar guibg=#101010 guifg=#0f0f0f")
	vim.cmd("highlight PmenuThumb guibg=#181818 guifg=#0f0f0f")

	-- Fold colors
	vim.cmd("highlight Folded guibg=NONE guifg=#3b3b3b")

	-- Gitsigns colors
	vim.cmd("highlight GitSignsAdd guifg=#9bcea5")
	vim.cmd("highlight GitSignsChange guifg=#f0c674")
	vim.cmd("highlight GitSignsDelete guifg=#ff8989")

	-- Telescope colors
	vim.cmd("highlight TelescopeBorder guibg=#0c0c0c guifg=#0c0c0c")
	vim.cmd("highlight TelescopeNormal guibg=#0c0c0c")
	vim.cmd("highlight TelescopeSelection guibg=NONE guifg=#f1f1f1")
	vim.cmd("highlight TelescopeSelectionCaret guibg=NONE guifg=#f1f1f1")
	vim.cmd("highlight TelescopeMatching guibg=NONE guifg=#f1f1f1")

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
		preset = "minimal",
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
