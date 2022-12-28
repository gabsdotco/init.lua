function get_branch_component()
  -- check if it's a git repo
  local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree")

  if is_git_repo == "false" then
    return ""
  end

  local branch = vim.fn.system("git branch --show-current")

  branch = branch:gsub("%s+", "")

  if branch == "" then
    return ""
  end

  return branch
end
