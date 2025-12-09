return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	lazy = true,
	cmd = "Telescope",
	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<C-g>", "<cmd>Telescope git_files<cr>", desc = "Git files" },
		{ "<C-s>", "<cmd>Telescope git_status<cr>", desc = "Git status" },
		{ "<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{
			"<C-e>",
			"<cmd>Telescope file_browser initial_mode=normal path=%:p:h select_buffer=true<cr>",
			desc = "File browser",
		},
		{
			"<S-f>",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find({
					prompt_title = "Current Buffer Search",
					initial_mode = "insert",
					previewer = false,
					sorting_strategy = "ascending",
				})
			end,
			desc = "Buffer fuzzy find",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local layout_strategies = require("telescope.pickers.layout_strategies")

		layout_strategies.vertical_fused = function(picker, max_columns, max_lines, layout_config)
			local layout = layout_strategies.vertical(picker, max_columns, max_lines, layout_config)

			layout.prompt.title = ""
			layout.results.title = ""

			if layout.preview then
				layout.preview.title = ""
				layout.preview.height = layout.preview.height + 1
				layout.preview.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

				layout.results.borderchars = { "─", "│", "─", "│", "├", "┤", "┤", "├" }
			else
				layout.results.borderchars = { "─", "│", "─", "│", "╭", "╮", "┤", "├" }
			end

			layout.results.height = layout.results.height + 1

			layout.prompt.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

			return layout
		end

		-- Telescope Setup
		telescope.setup({
			defaults = {
				initial_mode = "insert",
				layout_strategy = "vertical_fused",
				layout_config = {
					preview_cutoff = 1,
					width = 0.50,
					height = 0.6,
				},
				prompt_prefix = " ❯ ",
				selection_caret = "❯ ",
				path_display = { "truncate" },
				winblend = 0,
				color_devicons = false,
				sorting_strategy = "descending",
				mappings = {
					i = {
						["<C-s>"] = actions.select_vertical,
						["<C-x>"] = actions.select_horizontal,
					},
					n = {
						["<C-s>"] = actions.select_vertical,
						["<C-x>"] = actions.select_horizontal,
						["q"] = require("telescope.actions").close,
					},
				},
			},
			pickers = {
				git_status = {
					initial_mode = "normal",
				},
				buffers = {
					initial_mode = "normal",
				},
			},
			extensions = {
				fzf = {},
				file_browser = {
					previewer = true,
					grouped = true,
					hijack_netrw = false,
					hidden = true,
					initial_mode = "normal",
					use_fd = false,
					respect_gitignore = false,
				},
			},
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("fzf")
	end,
}
