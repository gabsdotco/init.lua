return {
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
}
