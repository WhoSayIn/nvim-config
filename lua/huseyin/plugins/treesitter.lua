return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local treesitter = require("nvim-treesitter.configs")

      treesitter.setup({
        highlight = {
          enable = true,
        },
        indent = { enable = true },
        autotag = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            scope_incremental = "<S-CR>",
            node_decremental = "<BS>",
          },
        },
        ensure_installed = {
          "bash",
          "comment",
          "css",
          "diff",
          "dockerfile",
          "elixir",
          "git_config",
          "gitignore",
          "graphql",
          "html",
          "javascript",
          "json",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "php",
          "prisma",
          "python",
          "regex",
          "rst",
          "ruby",
          "sql",
          "tsx",
          "twig",
          "typescript",
          "vim",
          "yaml",
        },
        auto_install = true,
      })
    end,
  },
}
