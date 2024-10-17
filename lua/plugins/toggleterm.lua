return {
	"akinsho/toggleterm.nvim",
	opts = {
		open_mapping = [[<c-\>]],
		direction = "float",
		float_opts = {
			width = 125,
			height = 35,
			titli_pos = "center",
		},
		start_in_insert = true,
		highlights = {
			Normal = {
				guibg = "NONE",
			},
			FloatBorder = {
				guifg = "#222222",
				guibg = "NONE",
			},
		},
	},
}
