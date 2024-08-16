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
	autotag = {
		enable = false,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
