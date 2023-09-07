return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")

		local null_ls_utils = require("null-ls.utils")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				code_actions.gitsigns,
				code_actions.refactoring,
				code_actions.shellcheck,

				-- lua
				formatting.stylua,

				-- typescript/javascript
				formatting.prettier,
				diagnostics.tsc,
				formatting.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file(".eslintrc.js")
					end,
				}),

				code_actions.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file(".eslintrc.js")
					end,
				}),
				diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file(".eslintrc.js")
					end,
				}),

				require("typescript.extensions.null-ls.code-actions"),

				-- python
				formatting.black,

				diagnostics.flake8.with({
					prefer_local = ".venv/bin",
				}),
				formatting.isort,

				-- kotlin
				diagnostics.ktlint,
				formatting.ktlint,
			},
			-- configure format on save
			-- on_attach = function(client, bufnr)
			--   if client.supports_method("textDocument/formatting") then
			--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			--     vim.api.nvim_create_autocmd("BufWritePre", {
			--       group = augroup,
			--       buffer = bufnr,
			--       callback = function()
			--         vim.lsp.buf.format({
			--           bufnr = bufnr,
			--           -- name = "null-ls",
			--         })
			--       end,
			--     })
			--   end
			-- end,
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
