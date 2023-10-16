local function highlight(tag, foreground, background)
  vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background)
end

highlight("StatusMode", "#000000", "#ffffff")
highlight("StatusBranch", "#ffffff", "NONE")
highlight("StatusFile", "#333333", "NONE")
highlight("StatusSaved", "#adb5bd", "NONE")
highlight("StatusWarnings", "#F6C177", "NONE")
highlight("StatusErrors", "#EB6F92", "NONE")
highlight("StatusInfos", "#89B4FA", "NONE")

highlight("BranchComponentStatus", "#444444", "NONE")
