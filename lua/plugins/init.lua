return {
	-- Git plugins
	{ "tpope/vim-fugitive" },
	{ "sindrets/diffview.nvim" },
	-- LSP plugins
	{ "L3MON4D3/LuaSnip", version = "2.*", build = "make install_jsregexp" },
	-- Utils
	{ "norcalli/nvim-colorizer.lua", event = "BufEnter", opts = { "*" } },
	{ "mg979/vim-visual-multi" },
}
