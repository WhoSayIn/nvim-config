local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "lua_ls",
    "pyright",
    "pylsp",
    "elixirls",
    "intelephense",
    "kotlin_language_server",
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

    -- PHP
    "phpcs",
    "phpcsfixer",

    -- Kotlin
    "ktlint",
  },
  automatic_installation = true,
})
