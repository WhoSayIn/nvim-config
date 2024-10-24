return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    local mason_null_ls = require("mason-null-ls")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "cssls",
        "elixirls",
        "emmet_ls",
        "graphql",
        "html",
        "kotlin_language_server",
        "lua_ls",
        "pylsp",
        "ts_ls",
        "ruby_lsp",
        "rubocop",
      },
      automatic_installation = true,
    })

    mason_null_ls.setup({
      ensure_installed = {
        -- JS TS
        "prettier",
        "stylua",
        "eslint_d",

        -- Python
        "mypy",
        "flake8",
        "isort",
        "autopep8",
        "ruff",
        "black",

        -- Kotlin
        "ktlint",
      },
      automatic_installation = true,
    })
  end,
}
