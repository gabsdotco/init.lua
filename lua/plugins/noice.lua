return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		presets = {
			lsp_doc_border = true,
		},
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
