function get_diagnostic_count(severity)
	if not rawget(vim, "lsp") then
		return 0
	end

	local count = vim.diagnostic.count(0, { serverity = severity })[severity]

	if count == nil then
		return 0
	end

	return count
end

function get_warnings_component()
	local warning_count = get_diagnostic_count(vim.diagnostic.severity.WARN)

	if warning_count > 0 then
		return warning_count
	end

	return ""
end

function get_errors_component()
	local error_count = get_diagnostic_count(vim.diagnostic.severity.ERROR)

	if error_count > 0 then
		return error_count
	end

	return ""
end

function get_infos_component()
	local info_count = get_diagnostic_count(vim.diagnostic.severity.INFO)

	if info_count > 0 then
		return info_count
	end

	return ""
end
