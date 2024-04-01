function get_warnings_component()
  local warning_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  if warning_count == 0 then
    return ""
  end

  return "● " .. warning_count
end

function get_errors_component()
  local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

  if error_count == 0 then
    return ""
  end

  return "● " .. error_count
end

function get_infos_component()
  local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  if info_count == 0 then
    return ""
  end

  return "● " .. info_count
end
