return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", tag = "v1.11.0" },
		{ "williamboman/mason-lspconfig.nvim", tag = "v1.32.0" },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		local lsp_attach = function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		end

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = true,
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"jsonls",
				"yamlls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = lsp_attach,
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua",
				"prettierd",
				"eslint_d",
			},
		})

		vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})

		vim.diagnostic.config({
			virtual_text = {
				severity = {
					min = vim.diagnostic.severity.WARN,
				},
			},
			float = {
				header = "",
				border = "single",
			},
			signs = {
				severity = {
					min = vim.diagnostic.severity.WARN,
				},
				text = {
					[vim.diagnostic.severity.ERROR] = "•",
					[vim.diagnostic.severity.WARN] = "•",
					[vim.diagnostic.severity.INFO] = "•",
					[vim.diagnostic.severity.HINT] = "•",
				},
			},
		})
	end,
}
