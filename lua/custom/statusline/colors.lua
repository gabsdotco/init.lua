require("config.colors.dark")
require("config.colors.light")

local function highlight(tag, foreground, background, style)
	vim.cmd("highlight " .. tag .. " guifg=" .. foreground .. " guibg=" .. background .. " gui=" .. style)
end

local is_light_mode = vim.o.background == "light"

local colors = is_light_mode and PaletteLight or PaletteDark

highlight("StatusMode", is_light_mode and colors.noir_0 or colors.text, colors.none, colors.none)
highlight("StatusBranch", is_light_mode and colors.noir_1 or colors.text, colors.none, colors.none)
highlight("StatusBranchChanges", is_light_mode and colors.noir_4 or colors.noir_5, colors.none, colors.none)
highlight("StatusFile", is_light_mode and colors.noir_6 or colors.noir_4, colors.none, colors.none)
highlight("StatusSaved", is_light_mode and colors.noir_5 or colors.noir_2, colors.none, colors.none)
highlight("StatusWarnings", colors.yellow, colors.none, colors.none)
highlight("StatusErrors", colors.red, colors.none, colors.none)
highlight("StatusInfos", colors.blue, colors.none, colors.none)
highlight("StatusHints", colors.green, colors.none, colors.none)
highlight("StatusSpotify", is_light_mode and colors.noir_5 or colors.noir_4, colors.none, colors.none)
