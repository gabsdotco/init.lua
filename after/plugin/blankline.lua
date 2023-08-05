-- Adding dots to indent lines
vim.cmd("set list")
vim.cmd("set lcs+=space:.")

-- Indent lines style
vim.cmd [[
  highlight IndentBlanklineChar guifg=#1c1c1c
  highlight IndentBlanklineSpaceChar guifg=#1c1c1c
  highlight IndentBlanklineSpaceCharBlankline guifg=#1c1c1c
  highlight IndentBlanklineContextChar guifg=#303030
]]

-- Indent lines settings
require("indent_blankline").setup({
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
})
