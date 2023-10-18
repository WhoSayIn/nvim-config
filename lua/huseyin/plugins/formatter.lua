return {
  "mhartington/formatter.nvim",
  cmd = { "Format", "FormatWrite" },
  config = function()
    require("formatter").setup({
      filetype = {
        ruby = { require("formatter.filetypes.ruby").rubocop },
        python = { require("formatter.filetypes.python").black },
        css = { require("formatter.filetypes.css").prettier },
        html = { require("formatter.filetypes.html").prettier },
        javascript = { require("formatter.filetypes.javascript").prettier },
        javascriptreact = { require("formatter.filetypes.javascriptreact").prettier },
        json = { require("formatter.filetypes.json").prettier },
        lua = { require("formatter.filetypes.lua").stylua },
        markdown = { require("formatter.filetypes.markdown").prettier },
        sh = { require("formatter.filetypes.sh").shfmt },
        typescript = { require("formatter.filetypes.typescript").prettier },
        typescriptreact = { require("formatter.filetypes.typescriptreact").prettier },
      },
    })
  end,
  init = function()
    local autocmd = vim.api.nvim_create_autocmd
    local augroup = vim.api.nvim_create_augroup

    autocmd({ "BufWritePost" }, {
      pattern = "*",
      desc = "Format on save",
      group = augroup("FormatOnSave", { clear = true }),
      command = "FormatWrite",
    })
  end,
}
