return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = true,
	keys = {
		{ "<C-t>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Tree" },
		{ "<leader>ts", "<cmd>NvimTreeToggleSide<cr>", desc = "Toggle Tree Side" },
	},
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 40,
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
						enable = false,
						color = false,
					},
					folder = {
						enable = false,
						color = false,
					},
				},
				glyphs = {
					default = " ",
					symlink = " ",
					folder = {
						arrow_closed = " ", -- Closed folder arrow
						arrow_open = " ", -- Open folder arrow
						default = " ", -- Default folder
						open = " ", -- Open folder
						empty = " ", -- Empty folder
						empty_open = " ", -- Open empty folder
						symlink = " ", -- Symlink folder
						symlink_open = " ", -- Open symlink folder
					},
					git = {
						unstaged = "~",
						staged = "✓",
						unmerged = "⚠",
						renamed = "➜",
						untracked = "+",
						deleted = "✕",
						ignored = "◌",
					},
				},
			},
			indent_markers = {
				enable = true,
				inline_arrows = false,
			},
		},
		filters = {
			git_ignored = false,
			dotfiles = false,
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

			-- Focus file when created from nvim-tree
			api.events.subscribe(api.events.Event.FileCreated, function(file)
				vim.cmd("edit " .. vim.fn.fnameescape(file.fname))
			end)

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

		-- Command to toggle tree direction (left/right)
		vim.api.nvim_create_user_command("NvimTreeToggleSide", function()
			local api = require("nvim-tree.api")
			local view = require("nvim-tree.view")

			-- Get current side
			local current_side = view.View.side
			local new_side = current_side == "left" and "right" or "left"

			-- Close the tree if it's open
			local was_open = view.is_visible()

			if was_open then
				api.tree.close()
			end

			-- Update the side configuration
			view.View.side = new_side

			-- Reopen if it was open before
			if was_open then
				api.tree.open()
			end

			print("NvimTree side switched to: " .. new_side)
		end, { desc = "Toggle NvimTree side (left/right)" })

		-- closes nvim-tree if it's the last open buffer
		vim.api.nvim_create_autocmd({ "QuitPre" }, {
			callback = function()
				vim.cmd("NvimTreeClose")
			end,
		})
	end,
}
