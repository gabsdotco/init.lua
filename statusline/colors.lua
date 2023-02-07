local function highlight(tag, foreground, background)
  vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background)
end

highlight("StatusMode", "#0A0A0A", "#ffffff")
highlight("StatusBranch", "#0A0A0A", "#adb5bd")
highlight("StatusFile", "#adb5bd", "NONE")
highlight("StatusSaved", "#adb5bd", "NONE")
highlight("StatusWarnings", "#0A0A0A", "#ffffff")
highlight("StatusErrors", "#0A0A0A", "#adb5bd")
