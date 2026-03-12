local M = {}

local config = require("custom.keystroke.config")

-- Window and buffer management
M.buf = nil
M.win = nil
M.timer = nil
M.hide_timer = nil
M.last_width = nil
M.update_timer = nil
M.on_hide_callback = nil

function M.set_on_hide(callback)
	M.on_hide_callback = callback
end

function M.setup_highlights()
	local opts = config.get()
	local hl = opts.highlight

	-- Check if highlights are already defined by theme
	local normal_hl = vim.api.nvim_get_hl(0, { name = "KeystrokeNormal" })
	local border_hl = vim.api.nvim_get_hl(0, { name = "KeystrokeBorder" })

	-- Only set defaults if not defined by theme
	if vim.tbl_isempty(normal_hl) then
		vim.api.nvim_set_hl(0, "KeystrokeNormal", {
			fg = hl.fg,
			bg = hl.bg,
		})
	end

	if vim.tbl_isempty(border_hl) then
		vim.api.nvim_set_hl(0, "KeystrokeBorder", {
			fg = hl.border,
			bg = "NONE",
		})
	end
end

function M.get_position(text_width)
	local opts = config.get()
	local ui = vim.api.nvim_list_uis()[1]

	if not ui then
		return { row = 1, col = vim.o.columns - text_width - 2 }
	end

	local height = opts.win_config.height
	-- Account for: text_width + left border (1) + right border (1) + right margin (2)
	local col = ui.width - text_width - 4

	-- Check if statusline is visible (laststatus: 0=never, 1=only if 2+ windows, 2=always, 3=global)
	local statusline_height = (vim.o.laststatus > 0) and 1 or 0

	if opts.position == "top-right" then
		return { row = 1, col = col }
	elseif opts.position == "bottom-right" then
		-- Subtract statusline height to avoid overlay
		return { row = ui.height - height - 2 - statusline_height, col = col }
	elseif opts.position == "bottom-center" then
		-- Subtract statusline height to avoid overlay
		return { row = ui.height - height - 2 - statusline_height, col = math.floor((ui.width - text_width) / 2) }
	end

	return { row = 1, col = col }
end

function M.create_buffer()
	if M.buf and vim.api.nvim_buf_is_valid(M.buf) then
		return M.buf
	end

	M.buf = vim.api.nvim_create_buf(false, true)
	vim.bo[M.buf].buftype = "nofile"
	vim.bo[M.buf].filetype = "keystroke"
	vim.bo[M.buf].modifiable = true

	return M.buf
end

function M.show(text)
	local opts = config.get()
	local padding = 2

	-- Calculate text width first (handles Unicode correctly)
	local text_display_width = vim.fn.strdisplaywidth(text)
	local padded_text = string.rep(" ", padding) .. text .. string.rep(" ", padding)
	local text_width = vim.fn.strdisplaywidth(padded_text)

	if text_width < 3 then
		text_width = 3
	end

	-- Cancel pending update timer
	if M.update_timer then
		vim.fn.timer_stop(M.update_timer)
		M.update_timer = nil
	end

	-- Debounce: wait 10ms before updating to batch rapid keystrokes
	M.update_timer = vim.fn.timer_start(10, function()
		vim.schedule(function()
			M._do_show(padded_text, text_width)
		end)
	end)
end

function M._do_show(padded_text, text_width)
	local opts = config.get()

	M.setup_highlights()

	local buf = M.create_buffer()
	vim.bo[buf].modifiable = true
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { padded_text })
	vim.bo[buf].modifiable = false

	local pos = M.get_position(text_width)

	local win_config = vim.tbl_deep_extend("force", opts.win_config, {
		row = pos.row,
		col = pos.col,
		width = text_width,
	})

	-- Only recreate window if width changed significantly or window invalid
	local need_recreate = not M.win or not vim.api.nvim_win_is_valid(M.win) or M.last_width ~= text_width

	if need_recreate then
		if M.win and vim.api.nvim_win_is_valid(M.win) then
			pcall(vim.api.nvim_win_close, M.win, false)
		end

		local ok = pcall(function()
			M.win = vim.api.nvim_open_win(buf, false, win_config)
			vim.wo[M.win].winhl = "Normal:KeystrokeNormal,FloatBorder:KeystrokeBorder"
			vim.wo[M.win].wrap = false
			if opts.win_config.border ~= "none" then
				vim.wo[M.win].winblend = 0
			end
			M.last_width = text_width
		end)

		if not ok then
			M.win = nil
			return
		end
	else
		-- Just update buffer in existing window
		pcall(vim.api.nvim_win_set_buf, M.win, buf)
	end

	-- Reset hide timer
	if M.hide_timer then
		vim.fn.timer_stop(M.hide_timer)
		M.hide_timer = nil
	end

	M.hide_timer = vim.fn.timer_start(opts.timeout, function()
		vim.schedule(function()
			M.hide()
		end)
	end)
end

function M.hide()
	if M.hide_timer then
		vim.fn.timer_stop(M.hide_timer)
		M.hide_timer = nil
	end

	if M.update_timer then
		vim.fn.timer_stop(M.update_timer)
		M.update_timer = nil
	end

	if M.win and vim.api.nvim_win_is_valid(M.win) then
		pcall(vim.api.nvim_win_close, M.win, false)
		M.win = nil
		M.last_width = nil
	end

	-- Call the on_hide callback to clear history
	if M.on_hide_callback then
		M.on_hide_callback()
	end
end

function M.clear()
	M.hide()
	if M.buf and vim.api.nvim_buf_is_valid(M.buf) then
		pcall(vim.api.nvim_buf_delete, M.buf, { force = true })
		M.buf = nil
	end
end

function M.is_visible()
	return M.win ~= nil and vim.api.nvim_win_is_valid(M.win)
end

return M
