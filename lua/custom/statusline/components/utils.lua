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

function M.get_mode_component()
	local mode = vim.api.nvim_get_mode().mode
	return get_mode_group(mode)
end

function M.get_saved_component()
	local saved = vim.bo.modified and "* Pending Changes" or ""

	if vim.bo.filetype == "TelescopePrompt" then
		saved = ""
	end

	return saved
end

return M
