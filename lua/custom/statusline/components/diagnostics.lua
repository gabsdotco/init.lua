M = {}

local get_diagnostic_count = function(severity)
	if not rawget(vim, "lsp") then
		return 0
	end

	local count = vim.diagnostic.count(0, { serverity = severity })[severity]

	if count == nil then
		return 0
	end

	return count
end

M.get_warnings_component = function()
	local warning_count = get_diagnostic_count(vim.diagnostic.severity.WARN)

	return "W:" .. warning_count
end

M.get_errors_component = function()
	local error_count = get_diagnostic_count(vim.diagnostic.severity.ERROR)

	return "E:" .. error_count
end

M.get_infos_component = function()
	local info_count = get_diagnostic_count(vim.diagnostic.severity.INFO)

	return "I:" .. info_count
end

M.get_hints_component = function()
	local hint_count = get_diagnostic_count(vim.diagnostic.severity.HINT)

	return "H:" .. hint_count
end

return M
