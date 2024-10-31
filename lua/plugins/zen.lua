return {
	"folke/zen-mode.nvim",
	config = function()
		local zen = require("zen-mode")

		zen.setup({
			plugins = {
				options = {
					enabled = true,
					laststatus = 0,
				},
				tmux = { enabled = true },
			},
		})

		vim.keymap.set("n", "<leader>z", function()
			zen.toggle({
				window = {
					width = 0.70,
				},
			})
		end, {})
	end,
}
