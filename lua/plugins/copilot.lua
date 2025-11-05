return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	opts = {
		filetypes = {
			yaml = true,
		},
		suggestion = {
			enabled = true,
			debounce = 75,
			auto_trigger = true,
			hide_during_completion = true,
			trigger_on_accept = true,
			keymap = {
				accept = "<C-j>",
			},
		},
	},
}
