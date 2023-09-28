return {
	"glepnir/lspsaga.nvim",
	config = function()
		local saga = require("lspsaga")
		saga.setup({
			scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
			definition = {
				keys = {
					quit = { "q", "<ESC>" },
					edit = "<CR>",
				},
			},
			finder = {
				keys = {
					toggle_or_open = { "o", "<CR>" },
					quit = { "q", "<ESC>" },
				},
			},
			outline = {
				keys = {
					quit = { "q", "<ESC>" },
					toggle_or_jump = { "o", "<CR>" },
				},
			},
			ui = {
				title = true,
				border = "rounded",
			},
			symbol_in_winbar = {
				enable = false,
			},
			lightbulb = {
				enable = false,
				enable_in_insert = false,
				sign = false,
				sign_priority = 40,
				virtual_text = false,
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
	end,
}
