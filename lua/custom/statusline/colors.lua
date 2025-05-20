local function highlight(tag, foreground, background, style)
	vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background .. " gui=" .. style)
end

highlight("StatusMode", Palette.text, Palette.none, "bold")
highlight("StatusBranch", Palette.text, Palette.none, Palette.none)
highlight("StatusBranchChanges", Palette.noir_5, Palette.none, Palette.none)
highlight("StatusFile", Palette.noir_4, Palette.none, Palette.none)
highlight("StatusSaved", Palette.noir_2, Palette.none, Palette.none)
highlight("StatusWarnings", Palette.yellow, Palette.none, Palette.none)
highlight("StatusErrors", Palette.red, Palette.none, Palette.none)
highlight("StatusInfos", Palette.blue, Palette.none, Palette.none)
