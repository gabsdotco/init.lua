return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.8",
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
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
					width = 0.45,
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
			},
			extensions = {
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

		-- Telescope Remaps
		vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		vim.keymap.set("n", "<C-g>", builtin.git_files, {})
		vim.keymap.set("n", "<C-s>", builtin.git_status, {})
		vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
		vim.keymap.set(
			"n",
			"<C-e>",
			":Telescope file_browser initial_mode=normal path=%:p:h select_buffer=true<CR>",
			{}
		)

		-- Telescope Buffer Fuzzy Find Remap
		vim.keymap.set("n", "<S-f>", function()
			builtin.current_buffer_fuzzy_find({
				prompt_title = "Current Buffer Search",
				initial_mode = "insert",
				previewer = false,
				sorting_strategy = "ascending",
			})
		end, {})
	end,
}
