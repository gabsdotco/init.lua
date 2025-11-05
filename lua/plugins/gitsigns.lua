return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	keys = {
		{ "<leader>gb", "<cmd>Gitsigns blame<cr>", desc = "Toggle File Blame" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Git Diff This" },
	},
	opts = {
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		current_line_blame = true,
		signs = {
			add = { text = "▍" },
			change = { text = "▍" },
			untracked = { text = "▍" },
			delete = { text = "▍" },
			topdelete = { text = "▍" },
			changedelete = { text = "▍" },
		},
	},
}
