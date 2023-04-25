local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	filters = {
		custom = { ".git" },
	},
	git = {
		ignore = false,
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})

local k = vim.keymap

k.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
k.set("n", "<leader>cf", ":NvimTreeFindFile<CR>", { desc = "Focus on open file in NvimTree" })

vim.cmd("hi NvimTreeNormal guibg=#001f2f") -- to look good with Solarized
