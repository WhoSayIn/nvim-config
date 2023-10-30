return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-rspec",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec"),
      },
    })


    local k = vim.keymap

    k.set("n", "<leader>tr", ":Neotest run<cr>")
    k.set("n", "<leader>ts", ":Neotest summary<cr>")
  end,
}
