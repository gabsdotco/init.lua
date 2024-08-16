require("noice").setup({
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
	routes = {
		{
			filter = { event = "lsp", kind = "progress" },
			opts = { skip = true },
		},
	},
})
