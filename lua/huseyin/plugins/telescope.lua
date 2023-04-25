local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
})

telescope.load_extension("fzf")

local k = vim.keymap

k.set("n", "<leader>ff", ":Telescope find_files<cr>")
k.set("n", "<leader>fe", ":Telescope oldfiles cwd_only=true<cr>")
k.set("n", "<leader>fs", ":Telescope live_grep<cr>")
k.set("n", "<leader>fc", ":Telescope commands<cr>")
k.set("n", "<leader>fg", ":Telescope grep_string<cr>")
k.set("n", "<leader>fb", ":Telescope buffers<cr>")
k.set("n", "<leader>fh", ":Telescope help_tags<cr>")
k.set("n", "<leader>fk", ":Telescope keymaps<cr>")
k.set("n", "<leader>fa", ":Telescope builtin<cr>")
