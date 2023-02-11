function get_warnings_component()
  local warning_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  return "W" .. warning_count
end

function get_errors_component()
  local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  return "E" .. error_count
end
