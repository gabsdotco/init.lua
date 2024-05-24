function get_component(tag, value)
	if value == "" then
		return ""
	end

	return "%#" .. tag .. "# " .. value .. " "
end

function get_component_separator()
	return "%="
end
