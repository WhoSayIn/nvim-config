return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    local null_ls_utils = require("null-ls.utils")
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      sources = {
        code_actions.gitsigns,
        code_actions.refactoring,
        code_actions.shellcheck,
      },
    })
  end,
}
