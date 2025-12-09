local M = {}

-- Simple static display - only updates on command
local spotify_display = ""
local timer = nil

-- Async update function using vim.system()
function M.update()
	if vim.fn.has("mac") == 0 then
		-- Not macOS, clear display
		spotify_display = ""

		if timer then
			M.stop_auto_update()
		end

		vim.schedule(function()
			vim.cmd("redrawstatus")
		end)
	end

	-- Quick async check if Spotify is running
	vim.system({ "pgrep", "-x", "Spotify" }, {}, function(obj)
		if obj.code ~= 0 or not obj.stdout or obj.stdout:match("^%s*$") then
			spotify_display = "♪ Nothing Playing"

			vim.schedule(function()
				vim.cmd("redrawstatus")
			end)

			return
		end

		-- Get current track asynchronously
		local script = [[
      tell application "Spotify"
        if player state is playing then
          return (artist of current track) & "|" & (name of current track)
        else
          return ""
        end if
      end tell
    ]]

		-- TODO: don't redraw if nothing has changed
		vim.system({ "osascript", "-e", script }, {}, function(result)
			vim.schedule(function()
				if result.code == 0 and result.stdout and result.stdout:match("%S") then
					local output = result.stdout:gsub("\n", "")
					local artist, track = output:match("([^|]*)|([^|]*)")

					if artist and track then
						local display = string.format("%s - %s", artist, track)

						if #display > 40 then
							display = string.sub(display, 1, 37) .. "..."
						end

						spotify_display = string.format("♪ %s", display)
					else
						spotify_display = "♪ Nothing Playing"
					end
				else
					spotify_display = "♪ Nothing Playing"
				end

				-- Trigger statusline redraw
				vim.cmd("redrawstatus")
			end)
		end)
	end)
end

-- Start auto-update (call this once in your config)
function M.start_auto_update(interval_ms)
	interval_ms = interval_ms or 5000 -- default 5 seconds

	if timer then
		timer:stop()
	end

	timer = vim.loop.new_timer()

	timer:start(0, interval_ms, function()
		M.update()
	end)
end

-- Stop auto-update
function M.stop_auto_update()
	if timer then
		timer:stop()
		timer = nil
	end
end

function M.play_pause()
	vim.system({ "osascript", "-e", 'tell application "Spotify" to playpause' })
	M.update()
end

function M.next_track()
	vim.system({ "osascript", "-e", 'tell application "Spotify" to next track' })
	M.update()
end

function M.previous_track()
	vim.system({ "osascript", "-e", 'tell application "Spotify" to previous track' })
	M.update()
end

function M.get_spotify_component()
	return spotify_display
end

function M.setup_commands()
	vim.api.nvim_create_autocmd({ "VimEnter" }, {
		callback = function()
			M.start_auto_update(5 * 1000) -- Update every 5 seconds
		end,
	})

	vim.api.nvim_create_autocmd({ "VimLeave" }, {
		callback = function()
			M.stop_auto_update()
		end,
	})

	vim.api.nvim_create_user_command("SpotifyPlayPause", function()
		M.play_pause()
	end, {})

	vim.api.nvim_create_user_command("SpotifyNext", function()
		M.next_track()
	end, {})

	vim.api.nvim_create_user_command("SpotifyPrevious", function()
		M.previous_track()
	end, {})
end

return M
