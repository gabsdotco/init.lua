local M = {}

local config = require("custom.keystroke.config")

-- Key representations
local key_map = {
	["<CR>"] = "<CR>",
	["<Enter>"] = "<CR>",
	["<Return>"] = "<CR>",
	["<Esc>"] = "<Esc>",
	["<Tab>"] = "<Tab>",
	["<BS>"] = "<BS>",
	["<Space>"] = "<Space>",
	["<Up>"] = "<Up>",
	["<Down>"] = "<Down>",
	["<Left>"] = "<Left>",
	["<Right>"] = "<Right>",
	["<Home>"] = "<Home>",
	["<End>"] = "<End>",
	["<PageUp>"] = "<PageUp>",
	["<PageDown>"] = "<PageDown>",
	["<Del>"] = "<Del>",
	["<Insert>"] = "<Ins>",
}

-- Modifier representations
local modifier_map = {
	["<C-"] = "<Ctrl-",
	["<M-"] = "<Alt-",
	["<D-"] = "<Cmd-",
	["<S-"] = "<Shift-",
	["<A-"] = "<Alt-",
}

-- Buffer for recent keystrokes
M.keystroke_buffer = {}

function M.format_key(key)
	local formatted = key

	-- Replace modifier prefixes with text
	for modifier, symbol in pairs(modifier_map) do
		if formatted:sub(1, #modifier) == modifier then
			local rest = formatted:sub(#modifier + 1)
			if rest:sub(-1) == ">" then
				rest = rest:sub(1, -2)
			end
			rest = M.format_key(rest)
			return symbol .. rest .. ">"
		end
	end

	-- Check direct key mapping
	if key_map[formatted] then
		return key_map[formatted]
	end

	-- Remove angle brackets for display if present
	if formatted:sub(1, 1) == "<" and formatted:sub(-1) == ">" then
		formatted = formatted:sub(2, -2)
	end

	-- Handle literal space character
	if formatted == " " then
		return "<Space>"
	end

	-- Lowercase for regular keys
	if #formatted == 1 then
		return formatted:lower()
	end

	return formatted
end

function M.should_ignore(key)
	local opts = config.get()

	-- Check if key should be ignored
	if opts.ignore.keys then
		for _, ignore_key in ipairs(opts.ignore.keys) do
			if key == ignore_key then
				return true
			end
		end
	end

	-- Check current mode
	local current_mode = vim.api.nvim_get_mode().mode
	if opts.ignore.modes then
		for _, mode in ipairs(opts.ignore.modes) do
			if current_mode:match(mode) then
				return true
			end
		end
	end

	return false
end

function M.add_keystroke(key)
	if M.should_ignore(key) then
		return
	end

	local opts = config.get()
	local formatted = M.format_key(key)

	-- Add to buffer
	table.insert(M.keystroke_buffer, formatted)

	-- Trim buffer to max_keys
	while #M.keystroke_buffer > opts.max_keys do
		table.remove(M.keystroke_buffer, 1)
	end

	return M.get_display_text()
end

function M.get_display_text()
	return table.concat(M.keystroke_buffer, " ")
end

function M.clear()
	M.keystroke_buffer = {}
end

return M
