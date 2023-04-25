vim.api.nvim_create_user_command("GoogleSearch", function()
	local cmd, args

	if vim.fn.has("win32") == 1 then
		cmd = "start"
	elseif vim.fn.has("unix") == 1 then
		if vim.fn.executable("xdg-open") == 1 then
			cmd = "xdg-open"
		elseif vim.fn.executable("open") == 1 then
			cmd = "open"
		else
			print("Error: Neither xdg-open nor open is available.")
			return
		end
	else
		print("Error: Unsupported operating system.")
		return
	end

	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local n_lines = math.abs(s_end[2] - s_start[2]) + 1
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
	lines[1] = string.sub(lines[1], s_start[3], -1)
	if n_lines == 1 then
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
	else
		lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
	end
	local selection = table.concat(lines, "\n")

	args = { "https://www.google.com/search?q=" .. vim.fn.escape(selection, "&") }

	vim.fn.jobstart({ cmd, unpack(args) })
end, {})
