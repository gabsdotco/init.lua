local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver",
	"lua_ls",
})

-- Fix "Undefined global 'vim'" Warning
lsp.nvim_workspace()

-- Setup LSP Preferences
lsp.set_preferences({
	suggest_lsp_servers = true,
})

lsp.set_sign_icons({
	error = "•",
	warn = "•",
	hint = "•",
	info = "•",
})

-- LSP Remaps
lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end)

-- LSP Diagnostic Remaps
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, {}) -- Open line diagnostics popup

-- LSP Setup
lsp.setup()
