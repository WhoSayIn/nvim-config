return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  config = function()
    require("refactoring").setup()

    vim.keymap.set({ "n", "x" }, "<leader>rt", function()
      require("refactoring").select_refactor()
    end)
  end,
}
