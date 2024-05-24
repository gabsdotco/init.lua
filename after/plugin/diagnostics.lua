vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})

-- LSP Diagnostic Remaps
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, {}) -- Open line diagnostics popup
