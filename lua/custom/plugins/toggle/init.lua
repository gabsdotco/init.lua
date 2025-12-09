local M = {}

local ALACRITTY_CONFIG_FILE = vim.fn.expand("~/.config/alacritty/alacritty.toml")
local THEME_STATE_FILE = vim.fn.stdpath("data") .. "/theme_state.txt"

M.load_state = function()
	local file = io.open(THEME_STATE_FILE, "r")

	if file then
		local mode = file:read("*all")
		file:close()
		return mode
	end

	return "dark"
end

M.save_state = function(mode)
	local file = io.open(THEME_STATE_FILE, "w")

	if file then
		file:write(mode)
		file:close()
	end
end

M.change_alacritty_theme = function(mode)
	local file = io.open(ALACRITTY_CONFIG_FILE, "r")

	if file then
		local content = file:read("*all")

		file:close()

		if mode == "light" then
			content = content:gsub("%.config/alacritty/themes/dark%.toml", ".config/alacritty/themes/light.toml")
		else
			content = content:gsub("%.config/alacritty/themes/light%.toml", ".config/alacritty/themes/dark.toml")
		end

		file = io.open(ALACRITTY_CONFIG_FILE, "w")

		if file then
			file:write(content)
			file:close()
		end
	end
end

M.set_theme = function(mode)
	if mode == "light" then
		vim.cmd("colorscheme mono-light")
	else
		vim.cmd("colorscheme mono-dark")
	end

	M.change_alacritty_theme(mode)
end

M.toggle_theme = function()
	local current_mode = M.load_state()

	local new_mode = current_mode == "light" and "dark" or "light"

	M.set_theme(new_mode)
	M.save_state(new_mode)
end

M.setup = function()
	local current_mode = M.load_state()

	M.set_theme(current_mode)

	vim.keymap.set("n", "<leader>tt", M.toggle_theme, {
		desc = "Toggle Theme",
	})
end

return M
