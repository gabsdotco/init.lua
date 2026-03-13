local M = {}

local config = require("custom.keystroke.config")
local keys = require("custom.keystroke.keys")
local display = require("custom.keystroke.display")

-- State
local is_setup = false
local is_enabled = false
local debounce_timer = nil
local pending_keys = {}

-- Simple keys lookup table for faster checking
local simple_keys = {
	["<CR>"] = true,
	["<Tab>"] = true,
	["<BS>"] = true,
	["<Esc>"] = true,
	["<Space>"] = true,
	["<Up>"] = true,
	["<Down>"] = true,
	["<Left>"] = true,
	["<Right>"] = true,
	["<Del>"] = true,
	["<Insert>"] = true,
	["<Home>"] = true,
	["<End>"] = true,
	["<PageUp>"] = true,
	["<PageDown>"] = true,
}

local function should_ignore(key_str)
	-- Quick check for special keys
	if key_str:sub(1, 1) ~= "<" then
		return false
	end

	-- Check if it's a simple special key
	if simple_keys[key_str] then
		return false
	end

	-- Check if it has modifiers
	if key_str:match("^<C%-") or key_str:match("^<M%-") or key_str:match("^<D%-") or key_str:match("^<S%-") then
		return false
	end

	-- Ignore other special keys (F-keys, etc.)
	return true
end

local function process_pending_keys()
	if #pending_keys == 0 then
		return
	end

	for _, key_str in ipairs(pending_keys) do
		keys.add_keystroke(key_str)
	end

	display.show(keys.get_display_text())

	pending_keys = {}
end

function M.setup(opts)
	if is_setup then
		return
	end

	config.setup(opts)

	-- Set callback to clear key history when display times out
	display.set_on_hide(function()
		keys.clear()
	end)

	vim.on_key(function(key)
		if not is_enabled then
			return
		end

		vim.schedule(function()
			local key_str = vim.fn.keytrans(key)

			if should_ignore(key_str) then
				return
			end

			table.insert(pending_keys, key_str)

			if debounce_timer then
				vim.fn.timer_stop(debounce_timer)
			end

			debounce_timer = vim.fn.timer_start(30, function()
				vim.schedule(process_pending_keys)
			end)
		end)
	end)

	is_setup = true
	is_enabled = config.get().enabled

	vim.api.nvim_create_autocmd("VimLeavePre", {
		callback = M.cleanup,
	})
end

function M.enable()
	is_enabled = true
end

function M.disable()
	is_enabled = false

	display.hide()
	keys.clear()

	pending_keys = {}

	if debounce_timer then
		vim.fn.timer_stop(debounce_timer)
		debounce_timer = nil
	end
end

function M.toggle()
	if is_enabled then
		M.disable()
	else
		M.enable()
	end

	return is_enabled
end

function M.cleanup()
	display.clear()

	if debounce_timer then
		vim.fn.timer_stop(debounce_timer)
	end
end

function M.get_status()
	return {
		enabled = is_enabled,
		visible = display.is_visible(),
		buffer = keys.get_display_text(),
	}
end

return M
