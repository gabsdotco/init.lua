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
		-- Override the internal padding constant to remove spaces
		local constants = require("bufferline.constants")

		constants.padding = ""

		require("bufferline").setup({
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
				left_trunc_marker = "... ",
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
