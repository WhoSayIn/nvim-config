return {
  "CRAG666/code_runner.nvim",
  opts = {
    mode = "float",
    float = {
      border = "rounded",
    },
    filetype = {
      ruby = "ruby",
      python = "python3",
    },
  },
  keys = {
    { "<leader>rr", ":RunCode<cr>", desc = "Run code" },
  },
}
