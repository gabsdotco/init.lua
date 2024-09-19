return {
	"VonHeikemen/lsp-zero.nvim",
	version = "4.x",
	priority = 900,
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

			vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
		end

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
}
