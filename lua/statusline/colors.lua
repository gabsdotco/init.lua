local function highlight(tag, foreground, background)
  vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background)
end

highlight("StatusMode", "#000000", "#ffffff")
highlight("StatusBranch", "#ffffff", "NONE")
highlight("StatusFile", "#333333", "NONE")
highlight("StatusSaved", "#adb5bd", "NONE")
highlight("StatusWarnings", "#feff57", "NONE")
highlight("StatusErrors", "#ff9898", "NONE")
highlight("StatusInfos", "#8afeff", "NONE")

highlight("BranchComponentStatus", "#444444", "NONE")
