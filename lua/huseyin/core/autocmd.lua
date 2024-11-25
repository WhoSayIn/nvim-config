local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePost", {
  pattern = "*.prisma",
  command = "make prisma-format",
})

autocmd("BufWritePost", {
  pattern = "resume.md",
  command = "make generate-pdf",
})

-- restart tmux on saving tmux config
autocmd("BufWritePost", {
  pattern = ".tmux.conf",
  command = 'silent !tmux source-file ~/.tmux.conf ; tmux display-message "Reloaded ~/.tmux.conf"',
})

-- restart kitty on saving kitty config
autocmd("BufWritePost", {
  pattern = "kitty.conf",
  command = "silent !kill -SIGUSR1 $(pgrep -a kitty)",
})

-- highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
autocmd("VimResized", {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "startuptime",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "gitsigns-blame",
    "fugitiveblame",
    "crunner",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
  end,
})
