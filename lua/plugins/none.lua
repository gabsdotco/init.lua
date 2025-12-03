return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	event = "VeryLazy",
	opts = function()
		local group = vim.api.nvim_create_augroup("LspFormatting", {})
		local nls = require("null-ls")

		return {
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.prettier,
				require("none-ls.diagnostics.eslint_d"),
			},
			on_attach = function(client, bufnr)
				local formatting_method = vim.lsp.protocol.Methods.textDocument_formatting

				if client.supports_method(formatting_method) then
					vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = group,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false, bufnr = bufnr })

							-- Temporary fix for null-ls formatting clearing diagnostics
							vim.diagnostic.enable(true, { bufnr = bufnr })
						end,
					})
				end
			end,
		}
	end,
}
