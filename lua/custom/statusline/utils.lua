M = {}

M.get_component = function(tag, value)
	if value == "" then
		return ""
	end

	return "%#" .. tag .. "# " .. value .. " "
end

M.get_component_separator = function()
	return "%="
end

return M
