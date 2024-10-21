local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
  pattern = "*.prisma",
  command = "make prisma-format",
})

autocmd("BufWritePost", {
  pattern = "resume.md",
  command = "make generate-pdf",
})

autocmd("BufWritePost", {
  pattern = ".tmux.conf",
  command = 'silent !tmux source-file ~/.tmux.conf ; tmux display-message "Reloaded ~/.tmux.conf"',
})

autocmd("BufWritePost", {
  pattern = "kitty.conf",
  command = "silent !kill -SIGUSR1 $(pgrep -a kitty)",
})

autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
