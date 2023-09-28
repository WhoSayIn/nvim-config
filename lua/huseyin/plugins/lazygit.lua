return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	init = function()
		local k = vim.keymap

		k.set("n", "<leader>lg", ":LazyGit<cr>")
	end,
}
