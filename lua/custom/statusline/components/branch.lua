function get_branch_component()
	if not vim.g.loaded_fugitive then
		return ""
	end

	local branch = vim.fn.FugitiveHead(10)

	if branch ~= "" then
		if string.len(branch) > 15 then
			branch = branch:sub(1, 15) .. "..."
		end

		return " " .. branch
	end

	return " No branch"
end
