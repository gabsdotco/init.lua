return {
	"jesseleite/nvim-noirbuddy",
	dependencies = {
		"tjdevries/colorbuddy.nvim",
	},
	priority = 1000,
	config = function()
		require("noirbuddy").setup({
			preset = "minimal",
			styles = {
				italic = true,
				bold = true,
				underline = true,
				undercurl = true,
			},
			colors = {
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
			},
		})

		-- Tokens colors
		vim.cmd("highlight @variable guifg=#ffffff")
		vim.cmd("highlight @variable.builtin guifg=#ffffff")
		vim.cmd("highlight @variable.member guifg=#666666")

		vim.cmd("highlight @lsp.type.function guifg=#adb5bd")

		vim.cmd("highlight @constant guifg=#777777")

		vim.cmd("highlight @keyword guifg=#444444")
		vim.cmd("highlight @keyword.operator guifg=#555555")
		vim.cmd("highlight @keyword.function guifg=#666666")
		vim.cmd("highlight @keyword.return guifg=#666666")

		vim.cmd("highlight @punctuation.bracket guifg=#555555")

		vim.cmd("highlight @constructor guifg=#888888")

		vim.cmd("highlight @operator guifg=#444444")
		vim.cmd("highlight @comment guifg=#333333")

		vim.cmd("highlight @string guifg=#444444")
		vim.cmd("highlight @boolean guifg=#444444")
		vim.cmd("highlight @number guifg=#444444")

		vim.cmd("highlight @property guifg=#777777")

		vim.cmd("highlight @keyword.coroutine guifg=#444444")

		vim.cmd("highlight @function.builtin guifg=#777777")
		vim.cmd("highlight @function.call guifg=#777777")
		vim.cmd("highlight @function.method.call guifg=#777777")

		vim.cmd("highlight @tag guifg=#888888")
		vim.cmd("highlight @tag.delimiter guifg=#888888")
		vim.cmd("highlight @tag.attribute guifg=#444444")

		vim.cmd("highlight @lsp.type.parameter guifg=#999999 gui=italic")

		vim.cmd("highlight @type guifg=#e2e2e2")
		vim.cmd("highlight @type.qualifier guifg=#444444")

		-- Vim command line error colors
		vim.cmd("highlight ErrorMsg guifg=#444444 guibg=#ff8989")

		-- NvimTree colors
		vim.cmd("highlight NvimTreeFolderIcon guifg=#555555")
		vim.cmd("highlight NvimTreeFolderName guifg=#999999")
		vim.cmd("highlight NvimTreeFileIcon guifg=#444444")
		vim.cmd("highlight NvimTreeFileName guifg=#444444")
		vim.cmd("highlight NvimTreeIndentMarker guifg=#222222")
		vim.cmd("highlight NvimTreeNormal guibg=NONE guifg=#555555")
		vim.cmd("highlight NvimTreeVertSplit guibg=NONE guifg=NONE")

		vim.cmd("highlight NvimTreeCursorLine guibg=#171717 guifg=NONE gui=bold")

		vim.cmd("highlight NvimTreeGitDirty guifg=#f7dba7")
		vim.cmd("highlight NvimTreeGitNew guifg=#9bcea5")
		vim.cmd("highlight NvimTreeGitStaged guifg=#89B4FA")
		vim.cmd("highlight NvimTreeGitUnstaged guifg=#addef8")
		vim.cmd("highlight NvimTreeGitUntracked guifg=#f7dba7")
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
		vim.cmd("highlight Visual guibg=#181818 guifg=NONE")

		-- Numbers Gutter
		vim.cmd("highlight LineNr guifg=#2b2b2b")

		vim.cmd("highlight Cursor guibg=NONE")
		vim.cmd("highlight CursorLine guibg=#181818 guifg=NONE")
		vim.cmd("highlight CursorLineNr guibg=NONE guifg=#666666 gui=bold")

		-- Split colors
		vim.cmd("highlight VertSplit guibg=NONE guifg=#101010")
		vim.cmd("highlight WinSeparator guibg=NONE guifg=#101010")

		-- Command line colors
		vim.cmd("highlight Pmenu guibg=#181818 guifg=#666666")
		vim.cmd("highlight PmenuSel guibg=#222222 guifg=#ffffff")
		vim.cmd("highlight PmenuSbar guibg=#181818 guifg=#0f0f0f")
		vim.cmd("highlight PmenuThumb guibg=#222222 guifg=#0f0f0f")

		-- Floating window colors
		vim.cmd("highlight NormalFloat guibg=NONE guifg=#f1f1f1")

		-- Fold colors
		vim.cmd("highlight Folded guibg=NONE guifg=#3b3b3b")

		-- Gitsigns colors
		vim.cmd("highlight GitSignsAdd guifg=#9bcea5")
		vim.cmd("highlight GitSignsChange guifg=#f7dba7")
		vim.cmd("highlight GitSignsDelete guifg=#ff8989")

		-- Telescope colors
		vim.cmd("highlight TelescopeBorder guibg=NONE guifg=#333333")

		-- Noice colors
		vim.cmd("highlight NoiceCmdlineIcon guibg=NONE guifg=#ffffff")
		vim.cmd("highlight NoiceCmdlinePopup guibg=NONE guifg=#666666")
		vim.cmd("highlight NoiceCmdlinePopupBorderInput guibg=NONE guifg=#444444")
		vim.cmd("highlight NoiceCmdlinePopupBorder guibg=NONE guifg=#222222")

		-- Devicons colors
		vim.cmd("highlight DevIconDefault guifg=#555555")
	end,
}
