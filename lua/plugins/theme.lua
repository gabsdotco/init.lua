return {
	dir = "~/.config/nvim/lua/custom/plugins/toggle",
	lazy = false,
	name = "theme",
	config = function()
		require("custom.plugins.toggle").setup()
	end,
}
