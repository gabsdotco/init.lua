return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	keys = {
		{ "<C-t>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Tree" },
	},
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 45,
			side = "right",
		},
		update_focused_file = {
			enable = true,
		},
		renderer = {
			group_empty = false,
			root_folder_label = false,
			highlight_git = true,
			special_files = {},
			icons = {
				git_placement = "after",
				modified_placement = "after",
				diagnostics_placement = "after",
				show = {
					folder_arrow = false,
				},
				web_devicons = {
					file = {
						enable = true,
						color = false,
					},
					folder = {
						enable = false,
						color = false,
					},
				},
				glyphs = {
					default = "",
					symlink = "",
					git = {
						unstaged = "",
						staged = "",
						unmerged = "",
						renamed = "󰁕",
						untracked = "",
						deleted = "",
						ignored = "",
					},
				},
			},
			indent_markers = {
				enable = true,
				inline_arrows = true,
			},
		},
		filters = {
			git_ignored = false,
			dotfiles = true,
		},
	},
	config = function(_, options)
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return {
					desc = "nvim-tree: " .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "<C-s>", api.node.open.vertical, opts("Open: Vertical Split"))
			vim.keymap.set("n", "<C-h>", api.tree.toggle_hidden_filter, opts("Toggle: Hidden Files"))

			-- remove default mappings
			vim.keymap.del("n", "<S-h>", { buffer = bufnr })
			vim.keymap.del("n", "L", { buffer = bufnr })
			vim.keymap.del("n", "<C-t>", { buffer = bufnr })
		end

		options.on_attach = my_on_attach

		require("nvim-tree").setup(options)

		-- closes nvim-tree if it's the last open buffer
		vim.api.nvim_create_autocmd({ "QuitPre" }, {
			callback = function()
				vim.cmd("NvimTreeClose")
			end,
		})
	end,
}
