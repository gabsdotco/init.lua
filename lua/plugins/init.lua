return {
	-- Git plugins
	{ "tpope/vim-fugitive" },
	{ "sindrets/diffview.nvim" },
	-- LSP plugins
	{ "L3MON4D3/LuaSnip", version = "2.*", build = "make install_jsregexp" },
	-- Utils
	{ "folke/ts-comments.nvim", event = "VeryLazy", enabled = vim.fn.has("nvim-0.10.0") == 1 },
	{ "norcalli/nvim-colorizer.lua", event = "BufEnter", opts = { "*" } },
	{ "mg979/vim-visual-multi" },
	{ "github/copilot.vim", version = "1.18.0" },
}
