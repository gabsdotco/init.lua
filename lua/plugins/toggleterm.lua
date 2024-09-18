return {
	"akinsho/toggleterm.nvim",
	opts = {
		open_mapping = [[<c-\>]],
		direction = "float",
		float_opts = {
			width = 110,
			height = 30,
			border = "curved",
			titli_pos = "center",
		},
		start_in_insert = true,
		highlights = {
			Normal = {
				guibg = "NONE",
			},
			FloatBorder = {
				guifg = "#333333",
				guibg = "NONE",
			},
		},
	},
}
