local git = require("custom.statusline.components.git")
local utils = require("custom.statusline.components.utils")
local components = require("custom.statusline.utils")
local diagnostics = require("custom.statusline.components.diagnostics")

require("custom.statusline.colors")

function StatusLine()
	local mode = utils.get_mode_component()
	local file = utils.get_file_component()
	local saved = utils.get_saved_component()

	local branch = git.get_branch_component()
	local changes = git.get_branch_changes_component()

	local infos = diagnostics.get_infos_component()
	local errors = diagnostics.get_errors_component()
	local warnings = diagnostics.get_warnings_component()

	return table.concat({
		components.get_component("StatusMode", mode),
		components.get_component("StatusBranch", branch),
		components.get_component("StatusBranchChanges", changes),
		components.get_component("StatusFile", file),
		components.get_component_separator(),
		components.get_component("StatusSaved", saved),
		components.get_component("StatusErrors", errors),
		components.get_component("StatusWarnings", warnings),
		components.get_component("StatusInfos", infos),
	})
end

vim.o.laststatus = 3
vim.o.statusline = "%!v:lua.StatusLine()"
