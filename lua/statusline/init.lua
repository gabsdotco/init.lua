require("statusline.components.mode")
require("statusline.components.branch")
require("statusline.components.diagnostics")
require("statusline.components.saved")
require("statusline.components.file")

require("statusline.utils")
require("statusline.colors")

function status_line()
	local mode = get_mode_component()
	local branch = get_branch_component()
	local file = get_file_component()
	local errors = get_errors_component()
	local warnings = get_warnings_component()
	local infos = get_infos_component()
	local saved = get_saved_component()

	return table.concat({
		get_component("StatusMode", mode),
		get_component("StatusBranch", branch),
		get_component("StatusFile", file),
		get_component_separator(),
		get_component("StatusSaved", saved),
		get_component("StatusErrors", errors),
		get_component("StatusWarnings", warnings),
		get_component("StatusInfos", infos),
	})
end

vim.o.laststatus = 3

vim.api.nvim_exec(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.status_line()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.status_line()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.status_line()
  augroup END
]],
	false
)
