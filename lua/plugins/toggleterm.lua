return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ [[<c-\>]], desc = "Toggle terminal" },
	},
	cmd = { "ToggleTerm", "TermExec" },
	opts = {
		open_mapping = [[<c-\>]],
		direction = "float",
		float_opts = {
			width = 140,
			height = 40,
			titli_pos = "center",
			border = "curved",
		},
		start_in_insert = true,
		highlights = {
			Normal = {
				link = "Normal",
			},
			FloatBorder = {
				link = "FloatBorder",
			},
		},
	},
}
