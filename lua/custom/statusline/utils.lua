M = {}

STATUS_LINE_GAP = 2

M.get_component = function(tag, value, no_gap)
	if value == "" then
		return ""
	end

	return "%#" .. tag .. "#" .. value .. string.rep(" ", STATUS_LINE_GAP * (no_gap and 0 or 1))
end

M.get_component_separator = function()
	return "%="
end

return M
