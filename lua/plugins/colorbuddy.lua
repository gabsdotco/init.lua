require("config.colors")

return {
	"tjdevries/colorbuddy.nvim",
	priority = 1000,
	config = function()
		-- highlight groups
		local highlights = {
			Normal = { fg = Palette.noir_3, bg = Palette.none },
			NonText = { fg = Palette.noir_2, bg = Palette.none },
			Comment = { fg = Palette.noir_5, style = "italic" },
			Constant = { fg = Palette.noir_2 },
			Title = { fg = Palette.text },
			String = { fg = Palette.noir_5 },
			Character = { fg = Palette.noir_3 },
			Directory = { fg = Palette.noir_4 },
			Number = { fg = Palette.noir_5 },
			Boolean = { fg = Palette.noir_5 },
			Float = { fg = Palette.noir_5 },
			Identifier = { fg = Palette.noir_2 },
			Function = { fg = Palette.noir_2 },
			Statement = { fg = Palette.noir_4 },
			Conditional = { fg = Palette.noir_4 },
			Repeat = { fg = Palette.noir_4 },
			Label = { fg = Palette.noir_4 },
			Operator = { fg = Palette.noir_5 },
			Keyword = { fg = Palette.noir_4 },
			Exception = { fg = Palette.red },
			PreProc = { fg = Palette.noir_4 },
			Include = { fg = Palette.red },
			Define = { fg = Palette.noir_4 },
			Macro = { fg = Palette.noir_4 },
			PreCondit = { fg = Palette.noir_4 },
			Type = { fg = Palette.noir_2 },
			StorageClass = { fg = Palette.noir_4 },
			Structure = { fg = Palette.noir_2 },
			Typedef = { fg = Palette.noir_2 },
			Special = { fg = Palette.noir_4 },
			SpecialChar = { fg = Palette.noir_3 },
			Tag = { fg = Palette.noir_4 },
			Delimiter = { fg = Palette.noir_3 },
			SpecialComment = { fg = Palette.noir_3 },
			Debug = { fg = Palette.red },
			Underlined = { style = "underline" },
			Error = { fg = Palette.red },
			Todo = { fg = Palette.teal, style = "bold" },
			StatusLine = { fg = Palette.text, bg = Palette.none },
			StatusLineNC = { fg = Palette.text, bg = Palette.none },
			LineNr = { bg = Palette.none, fg = Palette.noir_6 },
			Visual = { bg = Palette.noir_8 },

			["@variable"] = { fg = Palette.text },
			["@variable.builtin"] = { fg = Palette.text },
			["@variable.member"] = { fg = Palette.noir_3 },

			["@constructor"] = { fg = Palette.noir_2 },
			["@lsp.type.parameter"] = { fg = "#999999", style = "italic" },

			["@type"] = { fg = Palette.noir_1 },
			["@type.qualifier"] = { fg = Palette.noir_6 },
			["@keyword.coroutine"] = { fg = Palette.noir_6 },

			Cursor = { bg = Palette.none },
			CursorLine = { bg = Palette.none, fg = Palette.none },
			CursorLineNr = { bg = Palette.none, fg = Palette.noir_2, style = "bold" },

			GitSignsAdd = { fg = Palette.green, bg = Palette.none },
			GitSignsChange = { fg = Palette.yellow, bg = Palette.none },
			GitSignsDelete = { fg = Palette.red, bg = Palette.none },
			GitSignsCurrentLineBlame = { fg = Palette.noir_7 },

			TelescopeNormal = { bg = Palette.none, fg = Palette.noir_4 },
			TelescopeBorder = { bg = Palette.none, fg = Palette.noir_8 },
			TelescopeMatching = { bg = Palette.none, fg = Palette.noir_1 },
			TelescopeSelection = { bg = "#181818" },
			TelescopeResultsLineNr = { bg = "#181818" },
			TelescopeResultsDiffAdd = { bg = Palette.none, fg = Palette.green },
			TelescopeResultsDiffChange = { bg = Palette.none, fg = Palette.yellow },
			TelescopeResultsDiffDelete = { bg = Palette.none, fg = Palette.red },
			TelescopeResultsDiffUntracked = { bg = Palette.none, fg = Palette.yellow },

			IndentBlanklineChar = { fg = Palette.blue },
			IndentBlanklineSpaceChar = { fg = Palette.blue },
			IndentBlanklineSpaceCharBlankline = { fg = Palette.blue },
			IndentBlanklineContextChar = { fg = Palette.pink },

			NvimTreeGitDirty = { fg = Palette.yellow },
			NvimTreeGitNew = { fg = Palette.green },
			NvimTreeGitStaged = { fg = Palette.blue },
			NvimTreeGitUnstaged = { fg = Palette.lavender },
			NvimTreeGitUntracked = { fg = Palette.yellow },
			NvimTreeGitRenamed = { fg = Palette.lavender },
			NvimTreeGitIgnored = { fg = Palette.noir_7 },
			NvimTreeGitMerge = { fg = Palette.mauve },
			NvimTreeGitModified = { fg = Palette.peach },
			NvimTreeGitDeleted = { fg = Palette.red },

			NvimTreeWinSeparator = { bg = Palette.none, fg = Palette.none },
			NvimTreeFolderIcon = { fg = Palette.noir_4 },
			NvimTreeFolderName = { fg = Palette.noir_4 },
			NvimTreeFileIcon = { fg = Palette.noir_4 },
			NvimTreeFileName = { fg = Palette.noir_4 },
			NvimTreeExecFile = { fg = Palette.noir_4 },
			NvimTreeIndentMarker = { fg = Palette.noir_8 },
			NvimTreeNormal = { fg = Palette.noir_4 },
			NvimTreeVertSplit = { bg = Palette.none, fg = Palette.none },
			NvimTreeOpenedFolderIcon = { bg = Palette.none, fg = Palette.noir_4 },
			NvimTreeOpenedFolderName = { bg = Palette.none, fg = Palette.noir_4 },
			NvimTreeCursorLine = { bg = "#181818" },
			NvimTreeEmptyFolderName = { bg = Palette.none, fg = Palette.noir_4 },

			DevIconDefault = { fg = Palette.noir_4 },

			FloatBorder = { bg = Palette.none, fg = Palette.noir_8 },
			FloatShadow = { bg = Palette.none, fg = Palette.none },
			FloatShadowThrough = { bg = Palette.none, fg = Palette.none },

			NormalFloat = { bg = Palette.none, fg = Palette.noir_4 },

			Folded = { bg = Palette.none, fg = Palette.noir_7 },

			Pmenu = { bg = "#181818", fg = Palette.noir_3 },
			PmenuSel = { bg = Palette.noir_8, fg = Palette.text },
			PmenuSbar = { bg = "#181818", fg = Palette.none },
			PmenuThumb = { bg = Palette.noir_8, fg = Palette.none },

			NoiceCmdlineIcon = { bg = Palette.none, fg = Palette.text },
			NoiceCmdlinePopup = { bg = Palette.none, fg = Palette.noir_3 },
			NoiceCmdlinePopupBorderInput = { bg = Palette.none, fg = Palette.noir_5 },
			NoiceCmdlinePopupBorder = { bg = Palette.none, fg = Palette.noir_8 },

			NoiceLspProgressClient = { fg = Palette.noir_0 },
			NoiceLspProgressSpinner = { fg = Palette.noir_0 },

			DiagnosticSignError = { fg = Palette.red },
			DiagnosticSignWarn = { fg = Palette.yellow },
			DiagnosticSignInfo = { fg = Palette.blue },
			DiagnosticSignHint = { fg = Palette.green },

			CmpItemKindFunction = { fg = Palette.pink },
			CmpItemKindMethod = { fg = Palette.peach },
			CmpItemKindConstant = { fg = Palette.rosewater },
			CmpItemKindEnum = { fg = Palette.lavender },
			CmpItemKindField = { fg = Palette.sky },
			CmpItemKindProperty = { fg = Palette.yellow },
			CmpItemKindVariable = { fg = Palette.red },
			CmpItemKindSnippet = { fg = Palette.maroon },
			CmpItemKindKeyword = { fg = Palette.overlay2 },
			CmpItemKindText = { fg = Palette.blue },
		}

		-- apply highlights
		for group, opts in pairs(highlights) do
			local cmd = "highlight " .. group

			if opts.fg then
				cmd = cmd .. " guifg=" .. opts.fg
			end

			if opts.bg then
				cmd = cmd .. " guibg=" .. opts.bg
			end

			if opts.style then
				cmd = cmd .. " gui=" .. opts.style
			end

			vim.cmd(cmd)
		end
	end,
}
