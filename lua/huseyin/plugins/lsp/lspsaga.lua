local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({
	scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
	definition = {
		edit = "<CR>",
	},
	ui = {
		title = true,
		border = "rounded",
	},
	symbol_in_winbar = {
		enable = false,
	},
	code_action = {
		num_shortcut = true,
		show_server_name = true,
		keys = {
			quit = { "q", "<ESC>" },
			exec = "<CR>",
		},
	},
})
