function get_saved_component()
	local saved = vim.bo.modified and "*" or ""
	return saved
end
