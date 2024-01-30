local k = vim.keymap

vim.api.nvim_create_user_command("CopyRelativePath", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

k.set("n", "<leader>cp", "<cmd>CopyRelativePath<cr>", { desc = "Copy relative path of the current buffer" })

--------------------------------------------------------------------------------

vim.api.nvim_create_user_command("RspecCurrentFile", function()
  local path = vim.fn.expand("%")
  local cmd = 'tmux send-keys -t 2 "rspec ' .. path .. '" Enter'
  vim.fn.system(cmd)
end, {})

k.set("n", "<leader>rf", "<cmd>RspecCurrentFile<cr>", { desc = "Run rspec on the current file" })

--------------------------------------------------------------------------------

vim.api.nvim_create_user_command("RspecCurrentLine", function()
  local path = vim.fn.expand("%")
  local line = vim.fn.line(".")
  local cmd = 'tmux send-keys -t 2 "rspec ' .. path .. ":" .. line .. '" Enter'
  vim.fn.system(cmd)
end, {})

k.set("n", "<leader>rl", "<cmd>RspecCurrentLine<cr>", { desc = "Run rspec on the current file with line number" })
