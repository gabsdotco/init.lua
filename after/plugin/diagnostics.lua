vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
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
