local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
  pattern = "*.prisma",
  command = "make prisma-format",
})

autocmd("BufWritePost", {
  pattern = "resume.md",
  command = "make generate-pdf",
})
