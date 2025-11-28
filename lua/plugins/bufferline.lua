require("config.colors.dark")
require("config.colors.light")

return {
	"akinsho/bufferline.nvim",
	lazy = false,
	keys = {
		{
			"<C-q>",
			function()
				vim.cmd("bd")
				vim.cmd("bprevious")
			end,
			desc = "Kill Buffer",
		},
		{
			"<C-l>",
			"<cmd>BufferLineCycleNext<cr>",
			desc = "Next Buffer",
		},
		{
			"<C-h>",
			"<cmd>BufferLineCyclePrev<cr>",
			desc = "Previous Buffer",
		},
	},
	config = function()
		local is_light_mode = vim.o.background == "light"
		local colors = is_light_mode and PaletteLight or PaletteDark

		-- Override the internal padding constant to remove spaces
		local constants = require("bufferline.constants")

		constants.padding = ""

		require("bufferline").setup({
			highlights = {
				fill = {
					fg = is_light_mode and colors.noir_5 or colors.noir_4,
					bg = colors.none,
				},
				duplicate = {
					fg = is_light_mode and colors.noir_5 or colors.noir_4,
					bg = colors.none,
					italic = false,
				},
				duplicate_selected = {
					fg = is_light_mode and colors.noir_0 or colors.text,
					bg = colors.none,
					italic = false,
				},
				duplicate_visible = {
					fg = is_light_mode and colors.noir_4 or colors.noir_4,
					bg = colors.none,
					italic = false,
				},
				background = {
					fg = is_light_mode and colors.noir_5 or colors.noir_4,
					bg = colors.none,
				},
				close_button = {
					fg = is_light_mode and colors.noir_5 or colors.noir_4,
					bg = colors.none,
				},
				buffer_selected = {
					fg = is_light_mode and colors.noir_0 or colors.text,
					bg = is_light_mode and colors.none or colors.none,
					bold = true,
					italic = false,
				},
				close_button_selected = {
					fg = is_light_mode and colors.noir_0 or colors.text,
					bg = is_light_mode and colors.none or colors.none,
				},
				buffer_visible = {
					fg = is_light_mode and colors.noir_3 or colors.noir_4,
					bg = colors.none,
					bold = false,
					italic = false,
				},
				close_button_visible = {
					fg = is_light_mode and colors.noir_4 or colors.noir_4,
					bg = colors.none,
				},
				offset_separator = {
					fg = colors.none,
					bg = colors.none,
				},
				indicator_visible = {
					fg = colors.none,
					bg = colors.none,
				},
				indicator_selected = {
					fg = is_light_mode and colors.noir_0 or colors.none,
					bg = is_light_mode and colors.none or colors.none,
				},
				modified = {
					fg = is_light_mode and colors.noir_4 or colors.noir_4,
					bg = colors.none,
				},
				modified_visible = {
					fg = is_light_mode and colors.noir_3 or colors.noir_4,
					bg = colors.none,
				},
				modified_selected = {
					fg = is_light_mode and colors.noir_0 or colors.text,
					bg = is_light_mode and colors.none or colors.none,
				},
				separator = {
					fg = is_light_mode and colors.noir_7 or colors.noir_4,
					bg = colors.none,
				},
				separator_selected = {
					fg = is_light_mode and colors.noir_7 or colors.none,
					bg = is_light_mode and colors.noir_9 or colors.none,
				},
				separator_visible = {
					fg = is_light_mode and colors.noir_7 or colors.noir_4,
					bg = colors.none,
				},
			},
			options = {
				tab_size = 0,
				max_name_length = 20,
				mode = "buffers",
				modified_icon = "  *  ",
				show_buffer_icons = false,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_duplicate_prefix = true,
				show_tab_indicators = false,
				left_trunc_marker = "...",
				right_trunc_marker = "...",
				buffer_close_icon = "    ",
				always_show_bufferline = true,
				separator_style = { "", "" },
				name_formatter = function(buf)
					return buf.name
				end,
				custom_filter = function(buf_number)
					-- don't show nvim-tree
					if vim.bo[buf_number].filetype == "NvimTree" then
						return false
					end

					return true
				end,
				indicator = {
					style = "none",
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
		})
	end,
}
