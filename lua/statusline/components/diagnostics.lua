function get_warnings_component()
	local warning_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
	return warning_count
end

function get_errors_component()
	local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	return error_count
end

function get_infos_component()
	local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	return info_count
end
