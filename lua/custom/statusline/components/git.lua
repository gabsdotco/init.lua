M = {}

M.get_branch_component = function()
	local branch = vim.g.gitsigns_head

	if branch == nil then
		return "  No branch"
	end

	if branch ~= "" then
		if string.len(branch) > 20 then
			branch = branch:sub(1, 20) .. "..."
		end

		return "  " .. branch
	end

	return "  No branch"
end

M.get_branch_changes_component = function()
	local statuses = vim.b.gitsigns_status_dict

	local changes = 0
	local additions = 0
	local deletions = 0

	if statuses ~= nil then
		changes = statuses.added or 0
		additions = statuses.changed or 0
		deletions = statuses.removed or 0
	end

	return "%#GitSignsChange#~" .. changes .. " %#GitSignsAdd#+" .. additions .. " %#GitSignsDelete#-" .. deletions
end

return M
