local get_size = function(term)
	if term.direction == "horizontal" then
		return 20
	elseif term.direction == "vertical" then
		return vim.o.columns * 0.4
	end
end

require("toggleterm").setup({
	size = get_size,
	open_mapping = [[<c-\>]],
	direction = "vertical",
	start_in_insert = true,
	highlights = {
		Normal = {
			guibg = "NONE",
		},
	},
})
