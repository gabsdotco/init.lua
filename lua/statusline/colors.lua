local function highlight(tag, foreground, background)
  vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background)
end

highlight("StatusMode", "#000000", "#ffffff")
highlight("StatusBranch", "#000000", "#adb5bd")
highlight("StatusFile", "#adb5bd", "NONE")
highlight("StatusSaved", "#adb5bd", "NONE")
highlight("StatusWarnings", "#000000", "#ffffff")
highlight("StatusErrors", "#000000", "#adb5bd")
