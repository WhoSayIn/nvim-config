local status, navbuddy = pcall(require, "nvim-navbuddy")
if not status then
	return
end

navbuddy.setup({
	window = {
		border = "rounded",
	},
	lsp = {
		auto_attach = true,
	},
})

local k = vim.keymap

k.set("n", "<leader>nn", ":Navbuddy<CR>", { desc = "Open Navbuddy" })
