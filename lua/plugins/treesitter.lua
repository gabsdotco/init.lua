return {
	"nvim-treesitter/nvim-treesitter",
	build = "TSUpdate",
	dependencies = {
		"nvim-treesitter/playground",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			sync_install = false,
			auto_install = true,
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
			},
			indent = {
				enable = true,
				disable = "yaml",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}