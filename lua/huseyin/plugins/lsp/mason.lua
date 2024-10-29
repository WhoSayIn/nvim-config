return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

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
  end,
}
