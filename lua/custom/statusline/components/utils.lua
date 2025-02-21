M = {}

local function get_mode_group(mode)
	local groups = {
		n = "n",
		i = "i",
		v = "v",
		V = "v",
		[""] = "v",
		c = "c",
		s = "s",
		S = "s",
		[""] = "s",
		R = "r",
		r = "p",
		rm = "m",
		Rv = "v",
		["r?"] = "c",
		["!"] = "s",
		["t"] = "t",
	}

	local group = groups[mode] or "unknown"

	return group:upper()
end

M.get_mode_component = function()
	local mode = vim.api.nvim_get_mode().mode
	return get_mode_group(mode)
end

M.get_saved_component = function()
	local saved = vim.bo.modified and "*" or ""
	return saved
end

M.get_file_component = function()
	local file = vim.fn.expand("%:t")

	if file == "" then
		file = "[no name]"
	end

	if string.match(file, "NvimTree") then
		file = ""
	end

	return file
end

return M
