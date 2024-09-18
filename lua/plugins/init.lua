return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			color_icons = false,
			default = true,
			strict = true,
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		config = function()
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

			require("nvim-tree").setup({
				on_attach = my_on_attach,
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 35,
					side = "left",
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
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = "TSUpdate",
		dependencies = {
			"nvim-treesitter/playground",
		},
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				sync_install = false,
				auto_install = true,
				ensure_installed = {
					"lua",
					"javascript",
					"typescript",
				},
				indent = {
					enable = true,
					disable = "yaml",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{
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
	},
	{
		"akinsho/bufferline.nvim",
		opts = {
			highlights = {
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
				offset_separator = {
					fg = "NONE",
					bg = "NONE",
				},
				indicator_visible = {
					fg = "NONE",
					bg = "NONE",
				},
				indicator_selected = {
					fg = "NONE",
					bg = "NONE",
				},
				modified = {
					fg = "#555555",
					bg = "NONE",
				},
				modified_visible = {
					fg = "#555555",
					bg = "NONE",
				},
				modified_selected = {
					fg = "#ffffff",
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
		},
	},
	-- Git plugins
	{ "tpope/vim-fugitive" },
	{ "sindrets/diffview.nvim" },
	{
		"lewis6991/gitsigns.nvim",
		version = "0.7",
		opts = {
			current_line_blame = true,
			signs = {
				add = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
				change = {
					hl = "GitSignsChange",
					text = "┃",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = {
					hl = "GitSignsDelete",
					text = "┃",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				topdelete = {
					hl = "GitSignsDelete",
					text = "┃",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "┃",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				untracked = { hl = "GitSignsAdd", text = "┇", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			},
			signcolumn = true,
			numhl = false,
			linehl = false,
			word_diff = false,
		},
	},
	-- LSP plugins
	{
		"VonHeikemen/lsp-zero.nvim",
		version = "4.x",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			local lsp_attach = function(_, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end

			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					underline = true,
					update_in_insert = true,
					virtual_text = {
						spacing = 4,
						min = "Warning",
					},
				})

			-- LSP Diagnostic Config
			vim.diagnostic.config({
				float = { border = "rounded" },
			})

			-- LSP Diagnostic Remaps
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, {}) -- Open line diagnostics popup

			lsp_zero.extend_lspconfig({
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				sign_text = {
					error = "•",
					warn = "•",
					hint = "•",
					info = "•",
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
				},
				completion = {
					autocomplete = false,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-e>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered({
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					}),
					documentation = cmp.config.window.bordered({
						border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					}),
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			}

			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "lua_ls" },
				handlers = {
					function(server_name)
						if server_name == "ts_ls" then
							return
						end

						require("lspconfig")[server_name].setup({
							handlers = handlers,
						})
					end,
				},
			})
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			local border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			}

			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}

			require("typescript-tools").setup({
				handlers = handlers,
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		build = "make install_jsregexp",
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			local formatting = null_ls.builtins.formatting

			local function has_eslint_config(utils)
				return utils.root_has_file({
					".eslintrc",
					".eslintrc.cjs",
					".eslintrc.js",
					".eslintrc.json",
					"eslint.config.cjs",
					"eslint.config.js",
					"eslint.config.mjs",
				})
			end

			local sources = {
				formatting.prettierd,
				formatting.stylua,
				require("none-ls.code_actions.eslint").with({ condition = has_eslint_config }),
				require("none-ls.diagnostics.eslint").with({
					condition = has_eslint_config,
					diagnostics_format = "[eslint] #{m}",
				}),
			}

			local group = vim.api.nvim_create_augroup("LspFormatting", {})

			local event = "BufWritePre"
			local async = event == "BufWritePost"

			null_ls.setup({
				sources = sources,
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							buffer = bufnr,
							group = group,
						})

						vim.api.nvim_create_autocmd(event, {
							buffer = bufnr,
							group = group,
							callback = function()
								vim.lsp.buf.format({
									bufnr = bufnr,
									async = async,
								})
							end,
						})
					end
				end,
			})
		end,
	},
	-- CMDLine
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			cmdline = {
				view = "cmdline",
				format = {
					cmdline = { icon = ":" },
					search_down = { icon = "🔍⌄" },
					search_up = { icon = "🔍⌃" },
					filter = { icon = "$" },
					lua = { icon = "☾" },
					help = { icon = "?" },
				},
			},
			format = {
				level = {
					icons = false,
				},
			},
			views = {
				mini = {
					win_options = {
						winblend = 0,
					},
				},
			},
		},
	},
	-- Utils
	{
		"lukas-reineke/indent-blankline.nvim",
		version = "2.20.8",
		config = function()
			-- Adding dots to indent lines
			vim.cmd("set list")
			-- vim.cmd("set lcs+=space:.")

			-- Indent lines style
			vim.cmd([[
        highlight IndentBlanklineChar guifg=#1c1c1c
        highlight IndentBlanklineSpaceChar guifg=#1c1c1c
        highlight IndentBlanklineSpaceCharBlankline guifg=#1c1c1c
        highlight IndentBlanklineContextChar guifg=#333333
        ]])

			-- Indent lines settings
			require("indent_blankline").setup({
				-- space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = false,
			})
		end,
	},
	{ "tpope/vim-commentary" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "mg979/vim-visual-multi" },
	{ "github/copilot.vim", version = "1.18.0" },
	{
		"nvim-pack/nvim-spectre",
		config = function()
			local spectre = require("spectre")

			spectre.setup({
				color_devicons = true,
				open_cmd = "vnew",
				live_update = false,
				lnum_for_results = true,
				line_sep_start = "",
				result_padding = "¦  ",
				line_sep = "",
				highlight = {
					ui = "String",
					search = "DiffChange",
					replace = "DiffDelete",
				},
			})

			vim.keymap.set("n", "<leader>S", function()
				spectre.toggle()
			end, { desc = "Toggle Spectre" })

			vim.keymap.set("n", "<leader>sw", function()
				spectre.open_visual({ select_word = true })
			end, { desc = "Search current word" })

			vim.keymap.set("v", "<leader>sw", function()
				spectre.open_visual()
			end, { desc = "Search current word" })

			vim.keymap.set("n", "<leader>sp", function()
				spectre.open_file_search({ select_word = true })
			end, { desc = "Search on current file" })
		end,
	},
	{
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
	},
	{
		"jesseleite/nvim-noirbuddy",
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
		config = function()
			local minimal_palette = {
				background = "#101010",
				primary = "#333333",
				secondary = "#ffffff",
				noir_0 = "#f1f1f1",
				noir_1 = "#e2e2e2",
				noir_2 = "#666666",
				noir_3 = "#a7a7a7",
				noir_4 = "#555555",
				noir_5 = "#444444",
				noir_6 = "#444444",
				noir_7 = "#444444",
				noir_8 = "#333333",
				noir_9 = "#111111",
			}

			-- #TODO: Move all this to a custom plugin
			local setup_editor_colors = function()
				-- Tokens colors
				vim.cmd("highlight @variable guifg=#ffffff")
				vim.cmd("highlight @variable.builtin guifg=#ffffff")
				vim.cmd("highlight @variable.member guifg=#666666")

				vim.cmd("highlight @constant guifg=#777777")

				vim.cmd("highlight @keyword guifg=#444444")
				vim.cmd("highlight @keyword.operator guifg=#555555")
				vim.cmd("highlight @keyword.function guifg=#666666")
				vim.cmd("highlight @keyword.return guifg=#666666")

				vim.cmd("highlight @punctuation.bracket guifg=#555555")

				vim.cmd("highlight @constructor guifg=#888888")

				vim.cmd("highlight @operator guifg=#444444")
				vim.cmd("highlight @comment guifg=#222222")
				vim.cmd("highlight @string guifg=#444444")

				vim.cmd("highlight @keyword.coroutine guifg=#444444")

				vim.cmd("highlight @function.builtin guifg=#999999")
				vim.cmd("highlight @function.call guifg=#999999")
				vim.cmd("highlight @function.method.call guifg=#999999")

				vim.cmd("highlight @tag guifg=#888888")
				vim.cmd("highlight @tag.delimiter guifg=#888888")
				vim.cmd("highlight @tag.attribute guifg=#444444")

				vim.cmd("highlight @lsp.type.parameter guifg=#999999 gui=italic")

				vim.cmd("highlight @type guifg=#e2e2e2")
				vim.cmd("highlight @type.qualifier guifg=#444444")

				-- Vim command line error colors
				vim.cmd("highlight ErrorMsg guifg=#444444 guibg=#ff8989")

				-- NvimTree colors
				vim.cmd("highlight NvimTreeFolderIcon guifg=#555555")
				vim.cmd("highlight NvimTreeFolderName guifg=#999999")
				vim.cmd("highlight NvimTreeFileIcon guifg=#444444")
				vim.cmd("highlight NvimTreeFileName guifg=#444444")
				vim.cmd("highlight NvimTreeIndentMarker guifg=#222222")
				vim.cmd("highlight NvimTreeNormal guibg=NONE guifg=#555555")
				vim.cmd("highlight NvimTreeVertSplit guibg=NONE guifg=NONE")

				vim.cmd("highlight NvimTreeCursorLine guibg=#171717 guifg=NONE gui=bold")

				vim.cmd("highlight NvimTreeGitDirty guifg=#f0c674")
				vim.cmd("highlight NvimTreeGitNew guifg=#9bcea5")
				vim.cmd("highlight NvimTreeGitStaged guifg=#89B4FA")
				vim.cmd("highlight NvimTreeGitUnstaged guifg=#addef8")
				vim.cmd("highlight NvimTreeGitUntracked guifg=#f0c674")
				vim.cmd("highlight NvimTreeGitRenamed guifg=#f2ff8a")
				vim.cmd("highlight NvimTreeGitIgnored guifg=#333333")
				vim.cmd("highlight NvimTreeGitMerge guifg=#A978F6")
				vim.cmd("highlight NvimTreeGitModified guifg=#addef8")
				vim.cmd("highlight NvimTreeGitDeleted guifg=#ff8989")
				vim.cmd("highlight NvimTreeWinSeparator guibg=NONE guifg=#101010")

				-- Diagnostic colors
				vim.cmd("highlight DiagnosticError guifg=#ff8989")
				vim.cmd("highlight DiagnosticWarn guifg=#f0c674")
				vim.cmd("highlight DiagnosticInfo guifg=#89B4FA")
				vim.cmd("highlight DiagnosticHint guifg=#9bcea5")

				-- Diagnostic signs colors
				vim.cmd("highlight DiagnosticSignError guifg=#ff8989")
				vim.cmd("highlight DiagnosticSignWarn guifg=#f0c674")
				vim.cmd("highlight DiagnosticSignInfo guifg=#89B4FA")
				vim.cmd("highlight DiagnosticSignHint guifg=#9bcea5")

				-- Editor transparent colors
				vim.cmd("highlight Normal guibg=none")
				vim.cmd("highlight NonText guibg=none")
				vim.cmd("highlight Normal ctermbg=none")
				vim.cmd("highlight NonText ctermbg=none")

				vim.cmd("highlight clear LineNr")
				vim.cmd("highlight clear SignColumn")

				-- LSP colors
				vim.cmd("highlight FloatBorder guibg=NONE guifg=#222222")
				vim.cmd("highlight FloatShadow guibg=NONE guifg=NONE")
				vim.cmd("highlight FloatShadowThrough guibg=NONE guifg=NONE")

				-- Visual mode colors
				vim.cmd("highlight Visual guibg=#181818 guifg=NONE")

				-- Numbers Gutter
				vim.cmd("highlight LineNr guifg=#2b2b2b")

				vim.cmd("highlight Cursor guibg=NONE")
				vim.cmd("highlight CursorLine guibg=#181818 guifg=NONE")
				vim.cmd("highlight CursorLineNr guibg=NONE guifg=#666666 gui=bold")

				-- Split colors
				vim.cmd("highlight VertSplit guibg=NONE guifg=#101010")
				vim.cmd("highlight WinSeparator guibg=NONE guifg=#101010")

				-- Command line colors
				vim.cmd("highlight Pmenu guibg=#181818 guifg=#666666")
				vim.cmd("highlight PmenuSel guibg=#222222 guifg=#ffffff")
				vim.cmd("highlight PmenuSbar guibg=#181818 guifg=#0f0f0f")
				vim.cmd("highlight PmenuThumb guibg=#222222 guifg=#0f0f0f")

				-- Floating window colors
				vim.cmd("highlight NormalFloat guibg=NONE guifg=#f1f1f1")

				-- Fold colors
				vim.cmd("highlight Folded guibg=NONE guifg=#3b3b3b")

				-- Gitsigns colors
				vim.cmd("highlight GitSignsAdd guifg=#9bcea5")
				vim.cmd("highlight GitSignsChange guifg=#f0c674")
				vim.cmd("highlight GitSignsDelete guifg=#ff8989")

				-- Telescope colors
				vim.cmd("highlight TelescopeBorder guibg=NONE guifg=#333333")

				-- Noice colors
				vim.cmd("highlight NoiceCmdlineIcon guibg=NONE guifg=#ffffff")
				vim.cmd("highlight NoiceCmdlinePopup guibg=NONE guifg=#666666")
				vim.cmd("highlight NoiceCmdlinePopupBorderInput guibg=NONE guifg=#444444")
				vim.cmd("highlight NoiceCmdlinePopupBorder guibg=NONE guifg=#222222")

				-- Devicons colors
				vim.cmd("highlight DevIconDefault guifg=#555555")
			end

			SetupMinimalTheme = function()
				require("noirbuddy").setup({
					preset = "minimal",
					styles = {
						italic = true,
						bold = true,
						underline = true,
						undercurl = true,
					},
					colors = minimal_palette,
				})

				setup_editor_colors()
			end

			SetupMinimalTheme()
		end,
	},
}
