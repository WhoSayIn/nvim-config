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

    k.set("n", "<leader>tr", neotest.run.run, { desc = "Test: Run closest" })
    k.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Test: Run whole file" })
    k.set("n", "<leader>ts", function()
      neotest.summary.toggle()
    end, { desc = "Test: Show summary" })
    k.set("n", "<leader>to", function()
      neotest.output.open()
    end, { desc = "Test: Show output" })
    k.set("n", "<leader>tp", function()
      neotest.output_panel.open()
    end, { desc = "Test: Show output in a panel" })
  end,
}
