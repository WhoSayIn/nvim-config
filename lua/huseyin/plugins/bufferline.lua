return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          enforce_regular_tabs = false,
          indicator = { style = "underline" },
          separator_style = { "", "" },
          max_name_length = 30,
          max_prefix_length = 6,
          persist_buffer_sort = true,
          show_buffer_icons = true,
          show_close_icon = true,
          buffer_close_icon = "",
          show_buffer_close_icons = true,
          name_formatter = function(opts)
            return string.format(" %s ", opts.name)
          end,
          numbers = function(opts)
            return string.format(" %s ", opts.ordinal)
          end,
          diagnostics_indicator = function(_, _, diagnostics_dict, _)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " " or (e == "warning" and " " or "")
              s = s .. n .. sym
            end
            return s
          end,

          offsets = {
            {
              filetype = "neo-tree",
              text = "Neo-tree",
              highlight = "Directory",
              text_align = "center",
            },
          },
        },
      })

      local bufferline = require("bufferline")
      local k = vim.keymap

      -- <leader-#tabnumber>
      for i = 1, 9 do
        k.set("n", "<leader>" .. i, function()
          bufferline.go_to_buffer(i, true)
        end, { desc = "Bufferline tab " .. i })
      end

      -- last tab
      k.set("n", "<leader>" .. 0, function()
        bufferline.go_to_buffer(-1, true)
      end, { desc = "Bufferline last tab" })

      k.set("n", "<Tab>", function()
        bufferline.cycle(1)
      end, { desc = "Bufferline switch tabs" })

      k.set("n", "<S-Tab>", function()
        bufferline.cycle(-1)
      end, { desc = "Bufferline switch tabs in reverse" })

      k.set("n", "<leader>br", ":BufferLineMoveNext<cr>", { desc = "Bufferline move right" })
      k.set("n", "<leader>bl", ":BufferLineMovePrev<cr>", { desc = "Bufferline move left" })
    end,
  },
}
