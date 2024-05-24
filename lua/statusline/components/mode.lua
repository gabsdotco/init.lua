local function get_mode_group(mode)
	local groups = {
		n = "normal",
		i = "insert",
		v = "visual",
		V = "visual",
		[""] = "visual",
		c = "command",
		s = "select",
		S = "select",
		[""] = "select",
		R = "replace",
		r = "prompt",
		rm = "more",
		Rv = "virtual",
		["r?"] = "confirm",
		["!"] = "shell",
		["t"] = "terminal",
	}

	local group = groups[mode] or "unknown"

	return group:upper()
end

function get_mode_component()
	local mode = vim.fn.mode()
	return get_mode_group(mode)
end
