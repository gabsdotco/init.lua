local function highlight(tag, foreground, background)
  vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background)
end

highlight("StatusMode", "#e2e2e2", "#222222")
highlight("StatusBranch", "#e2e2e2", "#333333")
highlight("StatusFile", "#444444", "NONE")
highlight("StatusSaved", "#adb5bd", "NONE")
highlight("StatusWarnings", "#F6C177", "NONE")
highlight("StatusErrors", "#EB6F92", "NONE")
