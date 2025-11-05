return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Only show dashboard if nvim was opened without arguments
		if vim.fn.argc() == 0 then
			require("alpha").setup(require("alpha.themes.theta").config)
		end
	end,
}
