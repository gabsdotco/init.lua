local bufferline = require("bufferline")

bufferline.setup({
	highlights = {
		-- plain
		fill = {
			fg = "#555555",
			bg = "NONE",
		},
		duplicate = {
			fg = "#555555",
			bg = "NONE",
			italic = false,
		},
		duplicate_selected = {
			fg = "#555555",
			bg = "NONE",
			italic = false,
		},
		duplicate_visible = {
			fg = "#555555",
			bg = "NONE",
			italic = false,
		},
		background = {
			fg = "#555555",
			bg = "NONE",
		},
		close_button = {
			fg = "#555555",
			bg = "NONE",
		},
		-- selected
		buffer_selected = {
			fg = "#ffffff",
			bg = "NONE",
			bold = true,
			italic = false,
		},
		close_button_selected = {
			fg = "#ffffff",
			bg = "NONE",
		},
		-- visible
		buffer_visible = {
			fg = "#555555",
			bg = "NONE",
			bold = false,
			italic = false,
		},
		close_button_visible = {
			fg = "#555555",
			bg = "NONE",
		},
	},
	options = {
		tab_size = 18,
		mode = "buffers",
		modified_icon = "*",
		show_buffer_icons = false,
		left_trunc_marker = "...",
		right_trunc_marker = "...",
		buffer_close_icon = "",
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
				separator = " ",
				highlight = "NvimTreeNormal",
				filetype = "NvimTree",
				-- tree icon
				text = "File Explorer",
				text_align = "left",
			},
		},
	},
})
