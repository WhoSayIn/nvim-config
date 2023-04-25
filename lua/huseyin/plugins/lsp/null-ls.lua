local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.code_actions.shellcheck,
		null_ls.builtins.completion.spell,

		-- lua
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.formatting.stylua,

		-- typescript/javascript
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.diagnostics.tsc,
		null_ls.builtins.formatting.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		}),

		null_ls.builtins.code_actions.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		}),
		null_ls.builtins.diagnostics.eslint_d.with({
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js")
			end,
		}),

		require("typescript.extensions.null-ls.code-actions"),

		-- php
		null_ls.builtins.diagnostics.phpcs,
		null_ls.builtins.formatting.phpcsfixer,

		-- python
		null_ls.builtins.diagnostics.flake8,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.black,
	},

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
