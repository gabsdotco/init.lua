return {
	"folke/zen-mode.nvim",
	keys = {
		{
			"<leader>z",
			function()
				require("zen-mode").toggle({
					window = {
						width = 0.70,
						height = 0.90,
					},
				})
			end,
			desc = "Toggle zen mode",
		},
	},
	opts = {
		plugins = {
			options = {
				enabled = true,
				laststatus = 0,
			},
			tmux = { enabled = true },
		},
	},
}
