require("statusline.components.mode")
require("statusline.components.file")
require("statusline.components.branch")
require("statusline.components.diagnostics")
require("statusline.components.saved")

require("statusline.utils")
require("statusline.colors")

function status_line()
  local mode = get_mode_component()
  local branch = get_branch_component()
  local file = get_file_component()
  local errors = get_errors_component()
  local warnings = get_warnings_component()
  local saved = get_saved_component()

  return table.concat {
    get_component("StatusMode", mode),
    get_component("StatusBranch", branch),
    get_component("StatusFile", file),
    get_component_separator(),
    get_component("StatusSaved", saved),
    get_component("StatusErrors", errors),
    get_component("StatusWarnings", warnings),
  }
end

vim.o.statusline = "%!luaeval('status_line()')"
vim.o.laststatus = 3
