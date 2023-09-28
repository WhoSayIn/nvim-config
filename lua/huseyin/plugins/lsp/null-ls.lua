return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    local null_ls_utils = require("null-ls.utils")

    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      sources = {
        code_actions.gitsigns,
        code_actions.refactoring,
        code_actions.shellcheck,

        -- typescript/javascript
        diagnostics.tsc,

        code_actions.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file(".eslintrc.js")
          end,
        }),
        diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file(".eslintrc.js")
          end,
        }),

        require("typescript.extensions.null-ls.code-actions"),

        diagnostics.flake8.with({
          prefer_local = ".venv/bin",
        }),

        -- kotlin
        diagnostics.ktlint,
      },
    })
  end,
}
