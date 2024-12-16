local function highlight(tag, foreground, background, style)
	vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background .. " gui=" .. style)
end

highlight("StatusMode", Palette.noir_9, Palette.text, "bold")
highlight("StatusBranch", Palette.text, "NONE", "NONE")
highlight("StatusBranchChanges", Palette.noir_5, "NONE", "NONE")
highlight("StatusFile", Palette.noir_5, "NONE", "NONE")
highlight("StatusSaved", Palette.noir_2, "NONE", "NONE")
highlight("StatusWarnings", Palette.yellow, "NONE", "NONE")
highlight("StatusErrors", Palette.red, "NONE", "NONE")
highlight("StatusInfos", Palette.blue, "NONE", "NONE")
