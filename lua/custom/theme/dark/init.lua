local M = {}

local groups = require("custom.theme.dark.group").setup()

M.setup = function()
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"

	for group, setting in pairs(groups) do
		vim.api.nvim_set_hl(0, group, setting)
	end
end

return M
