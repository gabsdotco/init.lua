return {
	"folke/noice.nvim",
	-- tag = "v4.5.1",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		cmdline = {
			view = "cmdline",
			format = {
				cmdline = { icon = ":" },
				search_down = { icon = "🔍⌄" },
				search_up = { icon = "🔍⌃" },
				filter = { icon = "$" },
				lua = { icon = "☾" },
				help = { icon = "?" },
			},
		},
		format = {
			level = {
				icons = false,
			},
		},
		views = {
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		},
	},
}
