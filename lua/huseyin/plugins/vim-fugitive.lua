vim.api.nvim_create_user_command("ShowGitLogOfSelectedLines", function()
	local range = vim.fn.line("'<") .. "," .. vim.fn.line("'>")
	local file_path = vim.fn.expand("%")

	vim.cmd("G log -L " .. range .. ":" .. file_path)
end, {})

local k = vim.keymap
k.set("n", "<leader>gg", ":G<cr>", { desc = "Git status, with Fugitive" })
k.set("n", "<leader>gh", ":G log %<cr>", { desc = "Git history of current file" })
k.set("n", "<leader>gac", ":G add %<cr>", { desc = "Git add current file" })
k.set("n", "<leader>gaa", ":G add .<cr>", { desc = "Git add all" })
k.set("n", "<leader>gci", ":G commit<cr>", { desc = "Git commit" })
k.set("n", "<leader>gcm", ":G checkout master<cr>", { desc = "Git checkout master" })
k.set("n", "<leader>gco", ":G checkout<Space>", { desc = "Git checkout" })
k.set("n", "<leader>gbb", ":G blame<cr>", { desc = "Git blame" })
k.set("n", "<leader>gd", ":G diff<cr>", { desc = "Git diff" })
k.set("n", "<leader>grm", ":G rebase master<cr>", { desc = "Git rebase master" })
k.set("n", "<leader>grim", ":G rebase -i master<cr>", { desc = "Git rebase interactive master" })
k.set("n", "<leader>gra", ":G rebase --abort<cr>", { desc = "Git rebase abort" })
k.set("n", "<leader>grc", ":G rebase --continue<cr>", { desc = "Git rebase continue" })
k.set("n", "<leader>gl", ":G pull<cr>", { desc = "Git pull" })
k.set("n", "<leader>gpp", ":G push<cr>", { desc = "Git push" })
k.set("n", "<leader>gpu", ":G push -u<cr>", { desc = "Git push upstream" })
k.set("n", "<leader>gpfu", ":G push -fu<cr>", { desc = "Git force push upstream" })
k.set(
	"n",
	"<leader>gbh",
	":ene | 0r !git for-each-ref --sort=committerdate refs/heads/ --format='\\%(HEAD)|\\%(refname:short)|\\%(objectname:short)|\\%(contents:subject)|\\%(authorname)|(\\%(committerdate:relative))' | column -t -s '|' <cr>",
	{ desc = "Git branches historically" }
)
k.set(
	"v",
	"<Leader>gl",
	":<C-U>ShowGitLogOfSelectedLines<CR>",
	{ noremap = true, desc = "Git history of selected lines" }
)
