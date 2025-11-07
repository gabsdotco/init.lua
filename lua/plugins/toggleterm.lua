return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ [[<c-\>]], desc = "Toggle terminal" },
	},
	cmd = { "ToggleTerm", "TermExec" },
	config = function()
		local is_light_mode = vim.o.background == "light"
		local colors = is_light_mode and PaletteLight or PaletteDark

		require("toggleterm").setup({
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
					guibg = "NONE",
				},
				FloatBorder = {
					guifg = is_light_mode and colors.noir_8 or colors.noir_7,
					guibg = "NONE",
				},
			},
		})
	end,
}
