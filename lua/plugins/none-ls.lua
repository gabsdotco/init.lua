return {
	"nvimtools/none-ls.nvim",
	lazy = false,
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting

		local sources = {
			formatting.prettierd,
			formatting.stylua,
			require("none-ls.code_actions.eslint_d"),
			require("none-ls.diagnostics.eslint_d").with({
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
}
