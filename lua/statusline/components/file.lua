function get_file_component()
	local file = vim.fn.expand("%:t")

	if file == "" then
		file = "[no name]"
	end

	if string.match(file, "NvimTree") then
		file = ""
	end

	return file
end
