local setup, code_runner = pcall(require, "code_runner")
if not setup then
  return
end

code_runner.setup({
  mode = "float",
  float = {
    border = "rounded",
  },
  filetype = {
    ruby = "ruby",
  },
})

local k = vim.keymap

k.set("n", "<leader>rr", ":RunCode<cr>")
