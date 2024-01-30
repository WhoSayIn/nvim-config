return {
  "tpope/vim-rails",
  dependencies = { "tpope/vim-bundler", "tpope/vim-dispatch" },
  lazy = true,
  ft = { "ruby", "eruby" },
  keys = {
    { "<leader>ab", ":A<CR>", mode = { "n", "x" }, desc = "Alternate - Buffer" },
    { "<leader>av", ":AV<CR>", mode = { "n", "x" }, desc = "Alternate - Split Vertically" },
    { "<leader>as", ":AS<CR>", mode = { "n", "x" }, desc = "Alternate - Split Horizontally" },
    { "<leader>at", ":AT<CR>", mode = { "n", "x" }, desc = "Alternate - Tab" },
  },
}
