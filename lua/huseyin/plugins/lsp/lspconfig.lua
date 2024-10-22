return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "glepnir/lspsaga.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local k = vim.keymap

    local on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }

      opts["desc"] = "Lspsaga: show definition, references, implementations, usages"
      k.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts)

      opts["desc"] = "Lspsaga: go to declaration"
      k.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)

      opts["desc"] = "Lspsaga: see definition and make edits in window"
      k.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)

      opts["desc"] = "Lspsaga: go to implementation"
      k.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

      opts["desc"] = "Lspsaga: see available code actions"
      k.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

      opts["desc"] = "Lspsaga: smart rename"
      k.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

      opts["desc"] = "Lspsaga: show  diagnostics for line"
      k.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

      opts["desc"] = "Lspsaga: show diagnostics for cursor"
      k.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

      opts["desc"] = "Lspsaga: jump to previous diagnostic in buffer"
      k.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

      opts["desc"] = "Lspsaga: jump to next diagnostic in buffer"
      k.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

      opts["desc"] = "Lspsaga: show documentation for what is under cursor"
      k.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

      opts["desc"] = "Lspsaga: see outline on right hand side"
      k.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

      -- typescript specific keymaps (e.g. rename file and update imports)
      if client.name == "ts_ls" then
        k.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", { desc = "rename file and update imports" })
        k.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", { desc = "organize imports" })
        k.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", { desc = "remove unused variables" })
      end
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities["general"] = {
      positionEncodings = "utf-16",
    }

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

    lspconfig["pylsp"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentHighlightProvider = false
        on_attach(client, bufnr)
      end,
    })

    lspconfig["elixirls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["kotlin_language_server"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["ruby_lsp"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        rubyLsp = {
          featuresConfiguration = {
            inlayHint = {
              enableAll = true,
            },
          },
        },
      },
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    local _border = "single"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = _border,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = _border,
    })

    vim.diagnostic.config({
      float = { border = _border },
    })

    require("lspconfig.ui.windows").default_options = {
      border = _border,
    }
  end,
}
