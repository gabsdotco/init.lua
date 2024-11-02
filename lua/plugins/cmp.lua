return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			completion = {
				autocomplete = {
					require("cmp.types").cmp.TriggerEvent.TextChanged,
				},
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
}
