local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  definition = {
    keys = {
      edit = "<CR>",
    },
  },
  ui = {
    title = true,
    border = "rounded",
  },
  symbol_in_winbar = {
    enable = false,
  },
  lightbulb = {
    enable = false,
    enable_in_insert = false,
    sign = false,
    sign_priority = 40,
    virtual_text = false,
  },
  code_action = {
    num_shortcut = true,
    show_server_name = true,
    keys = {
      quit = { "q", "<ESC>" },
      exec = "<CR>",
    },
  },
})
