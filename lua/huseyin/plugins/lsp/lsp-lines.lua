return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    local lsp_lines = require("lsp_lines")
    lsp_lines.setup({
      vim.diagnostic.config({
        virtual_text = false,
      }),

      vim.keymap.set("n", "<Leader>dt", require("lsp_lines").toggle, { desc = "Toggle lsp_lines diagnostics" }),
    })
  end,
}
