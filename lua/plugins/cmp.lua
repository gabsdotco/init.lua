return {
	"hrsh7th/nvim-cmp",
	dependecies = {
		{ "L3MON4D3/LuaSnip", version = "2.*", build = "make install_jsregexp" },
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
			},
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.kind,
				},
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
					border = "border",
				}),
				documentation = cmp.config.window.bordered({
					border = "border",
				}),
			},
		})
	end,
}
