local status, lsp_lines = pcall(require, "lsp_lines")
if not status then
  return
end

lsp_lines.setup({
  vim.diagnostic.config({
    virtual_text = false,
  }),

  vim.keymap.set("n", "<Leader>dt", require("lsp_lines").toggle, { desc = "Toggle lsp_lines diagnostics" }),
})
