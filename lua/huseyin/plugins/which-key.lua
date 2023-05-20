local status, which_key = pcall(require, "which-key")
if not status then
  return
end

vim.o.timeout = true
vim.o.timeoutlen = 300
which_key.setup()
