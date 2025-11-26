-- local M = {}
--
-- local alacritty_config_file = vim.fn.expand("~/.config/alacritty/alacritty.toml")
-- local state_file = vim.fn.stdpath("data") .. "/theme_state.txt"
--
-- -- Save theme state to file
-- local function save_state(mode)
-- 	local file = io.open(state_file, "w")
--
-- 	if file then
-- 		file:write(mode)
-- 		file:close()
-- 	end
-- end
--
-- -- Load theme state from file
-- local function load_state()
-- 	local file = io.open(state_file, "r")
--
-- 	if file then
-- 		local mode = file:read("*all")
-- 		file:close()
-- 		return mode
-- 	end
--
-- 	return "light" -- default to light if no state file exists
-- end
--
-- -- Update Alacritty config only
-- local function update_alacritty(mode)
-- 	local file = io.open(alacritty_config_file, "r")
--
-- 	if file then
-- 		local content = file:read("*all")
--
-- 		file:close()
--
-- 		if mode == "light" then
-- 			content = content:gsub(
-- 				'"/Users/gabs/%.config/alacritty/themes/dark%.toml"',
-- 				'"/Users/gabs/.config/alacritty/themes/light.toml"'
-- 			)
-- 		else
-- 			content = content:gsub(
-- 				'"/Users/gabs/%.config/alacritty/themes/light%.toml"',
-- 				'"/Users/gabs/.config/alacritty/themes/dark.toml"'
-- 			)
-- 		end
--
-- 		file = io.open(alacritty_config_file, "w")
--
-- 		if file then
-- 			file:write(content)
-- 			file:close()
-- 		end
-- 	end
-- end
--
-- -- Reload colorscheme components
-- local function reload_colors()
-- 	-- -- Clear package cache for statusline colors
-- 	-- package.loaded["custom.statusline.colors"] = nil
--
-- 	vim.schedule(function()
-- 		local theme = require("config.theme")
--
-- 		theme.apply_custom_highlights()
--
-- 		-- Reload statusline colors
-- 		require("custom.statusline.colors")
--
-- 		-- Force complete UI redraw
-- 		vim.cmd("redraw")
-- 		vim.cmd("redrawstatus")
-- 		vim.cmd("redrawtabline")
-- 	end)
-- end
--
-- function M.toggle()
-- 	local is_light = vim.o.background == "light"
-- 	local new_mode = is_light and "dark" or "light"
--
-- 	-- Set background - this will trigger the OptionSet autocmd
-- 	vim.o.background = new_mode
--
-- 	-- Update alacritty and save state
-- 	update_alacritty(new_mode)
-- 	save_state(new_mode)
--
-- 	print("[THEME] - Switched to " .. new_mode .. " mode")
-- end
--
-- -- Restore theme on startup
-- function M.restore()
-- 	local saved_mode = load_state()
--
-- 	vim.o.background = saved_mode
--
-- 	update_alacritty(saved_mode)
-- end
--
-- -- Setup autocmd to reload colors when background changes
-- function M.setup_autocmd()
-- 	vim.api.nvim_create_autocmd("OptionSet", {
-- 		pattern = "background",
-- 		callback = function()
-- 			reload_colors()
-- 		end,
-- 		desc = "Reload colorscheme when background changes",
-- 	})
-- end
--
-- vim.keymap.set("n", "<leader>tt", M.toggle, { desc = "Toggle dark/light theme" })
-- vim.api.nvim_create_user_command("ToggleTheme", M.toggle, {})
--
-- return M

require("config.colors.dark")
require("config.colors.light")

vim.o.background = "light"

local highlights = vim.o.background == "light" and PaletteLightHighlights or PaletteDarkHighlights

for group, opts in pairs(highlights) do
	local cmd = "highlight " .. group

	if opts.fg then
		cmd = cmd .. " guifg=" .. opts.fg
	end

	if opts.bg then
		cmd = cmd .. " guibg=" .. opts.bg
	end

	if opts.style then
		cmd = cmd .. " gui=" .. opts.style
	end

	vim.cmd(cmd)
end
