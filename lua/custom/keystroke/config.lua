local M = {}

M.defaults = {
	enabled = true,
	position = "top-right",
	timeout = 1500,
	max_keys = 3,
	win_config = {
		relative = "editor",
		height = 1,
		style = "minimal",
		border = "single",
		focusable = false,
		noautocmd = true,
	},
	highlight = {
		bg = "#1a1a1a",
		fg = "#888888",
		border = "#333333",
	},
	ignore = {
		modes = {},
		keys = {
			"<LeftMouse>",
			"<LeftRelease>",
			"<LeftDrag>",
			"<2-LeftMouse>",
			"<3-LeftMouse>",
			"<4-LeftMouse>",
			"<RightMouse>",
			"<RightRelease>",
			"<MiddleMouse>",
		},
	},
}

M.options = {}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.defaults, opts or {})
	return M.options
end

function M.get()
	return M.options
end

return M
