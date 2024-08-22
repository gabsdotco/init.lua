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
	ensure_installed = { "tsserver", "lua_ls" },
	handlers = {
		function(server_name)
			-- Skip tsserver-lsp since it will be replaced by ts-tools
			if server_name == "tsserver" then
				return
			end

			require("lspconfig")[server_name].setup({
				handlers = handlers,
			})
		end,
	},
})

require("typescript-tools").setup({
	handlers = handlers,
})
