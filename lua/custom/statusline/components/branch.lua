function get_branch_component()
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

function get_branch_changes_component()
	local statuses = vim.g.gitsigns_status_dict

	if statuses then
		print(statuses.added)
	end

	return ""

	-- local changes = statuses.added | 0
	-- local additions = statuses.changed | 0
	-- local deletions = statuses.removed | 0

	-- -- Parse each line of the git status output
	-- for _, line in ipairs(statuses) do
	-- 	local status = line:sub(1, 2)
	--
	-- 	if status:match("M") then
	-- 		changes = changes + 1
	-- 	elseif status:match("A") or status == "??" then
	-- 		additions = additions + 1
	-- 	elseif status:match("D") then
	-- 		deletions = deletions + 1
	-- 	end
	-- end

	-- return "%#GitSignsChange#~" .. changes .. " %#GitSignsAdd#+" .. additions .. " %#GitSignsDelete#-" .. deletions

	-- if not vim.g.loaded_fugitive then
	-- 	return ""
	-- end
	--
	-- local git_status = vim.fn.systemlist("git status --porcelain")
	--
	-- -- Initialize counters
	-- local changes = 0
	-- local additions = 0
	-- local deletions = 0
	--
	-- -- Parse each line of the git status output
	-- for _, line in ipairs(git_status) do
	-- 	local status = line:sub(1, 2)
	--
	-- 	if status:match("M") then
	-- 		changes = changes + 1
	-- 	elseif status:match("A") or status == "??" then
	-- 		additions = additions + 1
	-- 	elseif status:match("D") then
	-- 		deletions = deletions + 1
	-- 	end
	-- end
	--
	-- return "%#GitSignsChange#~" .. changes .. " %#GitSignsAdd#+" .. additions .. " %#GitSignsDelete#-" .. deletions
end
