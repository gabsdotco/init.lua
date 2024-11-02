function get_component(tag, value, no_space)
	if value == "" then
		return ""
	end

	return "%#" .. tag .. "# " .. value .. " "
end

function get_component_separator()
	return "%="
end
