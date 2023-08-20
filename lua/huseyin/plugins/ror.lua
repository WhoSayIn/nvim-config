local setup, ror = pcall(require, "ror")
if not setup then
  return
end

ror.setup()

vim.keymap.set("n", "<Leader>rc", ":lua require('ror.commands').list_commands()<CR>", { silent = true })
