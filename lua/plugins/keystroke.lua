return {
	"custom/keystroke",
	name = "keystroke",
	dir = vim.fn.stdpath("config") .. "/lua/custom/keystroke",
	main = "custom.keystroke",
	event = "VeryLazy",
	opts = {
		enabled = true,
		position = "bottom-center",
		timeout = 1500,
		max_keys = 5,
		win_config = {
			border = "single",
		},
	},
}
