function get_branch_component()
  local branch = vim.fn.system("git branch --show-current")

  if string.find(branch, "fatal:") then
    return ""
  end

  branch = branch:gsub("%s+", "")

  if branch == "" then
    return ""
  end

  if string.len(branch) > 15 then
    branch = branch:sub(1, 15) .. "..."
  end

  local total_files_changed = vim.fn.system("git diff --name-only | wc -l")

  if string.find(total_files_changed, "fatal:") then
    return ""
  end

  total_files_changed = total_files_changed:gsub("%s+", "")

  if total_files_changed == "0" then
    return " " .. branch
  end

  return " " .. branch .. " [+" .. total_files_changed .. "]"
end
