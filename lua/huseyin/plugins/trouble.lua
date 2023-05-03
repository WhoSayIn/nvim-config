local status, trouble = pcall(require, "trouble")
if not status then
	return
end

trouble.setup({})

local k = vim.keymap

k.set("n", "<leader>tt", ":TroubleToggle<cr>")
