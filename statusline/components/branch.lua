function get_branch_component()
  local branch = vim.fn.system("git branch --show-current")

  if string.find(branch, "fatal:") then
    return ""
  end

  branch = branch:gsub("%s+", "")

  if branch == "" then
    return ""
  end

  return branch
end
