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

function get_mode_component()
	local mode = vim.fn.mode()
	return get_mode_group(mode)
end
