local function highlight(tag, foreground, background, style)
	vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background .. " gui=" .. style)
end

highlight("StatusMode", "#000000", "#ffffff", "bold")
highlight("StatusBranch", "#ffffff", "NONE", "NONE")
highlight("StatusFile", "#444444", "NONE", "NONE")
highlight("StatusSaved", "#adb5bd", "NONE", "NONE")
highlight("StatusWarnings", "#f0c674", "NONE", "NONE")
highlight("StatusErrors", "#ff9898", "NONE", "NONE")
highlight("StatusInfos", "#89B4FA", "NONE", "NONE")

highlight("BranchComponentStatus", "#444444", "NONE", "NONE")
