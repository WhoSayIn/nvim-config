return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-rspec",
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-rspec"),
      },
    })

    local k = vim.keymap

    k.set("n", "<leader>tr", neotest.run.run)
    k.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end)
    k.set("n", "<leader>ts", function()
      neotest.summary.toggle()
    end)
    k.set("n", "<leader>to", function()
      neotest.output.open()
    end)
  end,
}
