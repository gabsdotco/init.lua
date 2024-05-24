function get_file_component()
	local file = vim.fn.expand("%:t")

	if file == "" then
		file = "[no name]"
	end

	return file
end
