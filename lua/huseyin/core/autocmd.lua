local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
  pattern = "*.prisma",
  command = "make prisma-format",
})
