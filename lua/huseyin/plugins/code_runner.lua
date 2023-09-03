return {
  "CRAG666/code_runner.nvim",
  opts = {
    mode = "float",
    float = {
      border = "rounded",
    },
    filetype = {
      ruby = "ruby",
    },
  },
  config = function()
    local k = vim.keymap

    k.set("n", "<leader>rr", ":RunCode<cr>")
  end,
}
