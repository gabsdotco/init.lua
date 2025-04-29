require("config.colors")

return {
	"akinsho/bufferline.nvim",
	lazy = false,
	keys = {
		{
			"<C-q>",
			function()
				vim.cmd("bd")
				vim.cmd("bprev")
			end,
			desc = "Kill Buffer",
		},
		{
			"<C-l>",
			"<cmd>bnext<cr>",
			desc = "Next Buffer",
		},
		{
			"<C-h>",
			"<cmd>bprev<cr>",
			desc = "Previous Buffer",
		},
	},
	opts = {
		highlights = {
			fill = {
				fg = Palette.noir_4,
				bg = Palette.none,
			},
			duplicate = {
				fg = Palette.noir_4,
				bg = Palette.none,
				italic = false,
			},
			duplicate_selected = {
				fg = Palette.noir_4,
				bg = Palette.none,
				italic = false,
			},
			duplicate_visible = {
				fg = Palette.noir_4,
				bg = Palette.none,
				italic = false,
			},
			background = {
				fg = Palette.noir_4,
				bg = Palette.none,
			},
			close_button = {
				fg = Palette.noir_4,
				bg = Palette.none,
			},
			buffer_selected = {
				fg = Palette.text,
				bg = Palette.none,
				bold = true,
				italic = false,
			},
			close_button_selected = {
				fg = Palette.text,
				bg = Palette.none,
			},
			buffer_visible = {
				fg = Palette.noir_4,
				bg = Palette.none,
				bold = false,
				italic = false,
			},
			close_button_visible = {
				fg = Palette.noir_4,
				bg = Palette.none,
			},
			offset_separator = {
				fg = Palette.none,
				bg = Palette.none,
			},
			indicator_visible = {
				fg = Palette.none,
				bg = Palette.none,
			},
			indicator_selected = {
				fg = Palette.none,
				bg = Palette.none,
			},
			modified = {
				fg = Palette.noir_4,
				bg = Palette.none,
			},
			modified_visible = {
				fg = Palette.noir_4,
				bg = Palette.none,
			},
			modified_selected = {
				fg = Palette.text,
				bg = Palette.none,
			},
		},
		options = {
			tab_size = 18,
			mode = "buffers",
			modified_icon = "*",
			show_buffer_icons = false,
			left_trunc_marker = "...",
			right_trunc_marker = "...",
			buffer_close_icon = "",
			show_duplicate_prefix = true,
			always_show_bufferline = false,
			separator_style = { "", "" },
			custom_filter = function(buf_number)
				-- don't show nvim-tree
				if vim.bo[buf_number].filetype == "NvimTree" then
					return false
				end

				return true
			end,
			indicator = {
				icon = " ",
				style = "icon",
			},
			diagnostics = false,
			offsets = {
				{
					separator = "",
					highlight = "NvimTreeNormal",
					filetype = "NvimTree",
					-- tree icon
					text = "",
					text_align = "left",
				},
			},
		},
	},
}
