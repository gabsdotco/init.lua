require("deeckard.statusline.components.mode")
require("deeckard.statusline.components.file")
require("deeckard.statusline.components.branch")
require("deeckard.statusline.components.diagnostics")

require("deeckard.statusline.utils")
require("deeckard.statusline.colors")

function status_line()
  local mode = get_mode_component()
  local file = get_file_component()
  local branch = get_branch_component()
  local errors = get_errors_component()
  local warnings = get_warnings_component()

  return table.concat {
    get_component("StatusMode", mode),
    get_component("StatusBranch", branch),
    get_component("StatusFile", file),
    get_component_separator(),
    get_component("StatusErrors", errors),
    get_component("StatusWarnings", warnings),
  }
end

vim.o.statusline = "%!luaeval('status_line()')"
vim.o.laststatus = 3
