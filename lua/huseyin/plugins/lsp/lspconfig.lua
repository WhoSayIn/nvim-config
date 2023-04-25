local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local k = vim.keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	k.set(
		"n",
		"gf",
		"<cmd>Lspsaga lsp_finder<CR>",
		opts,
		{ desc = "Lspsaga: show definition, references, implementations, usages" }
	)
	k.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts, { desc = "Lspsaga: go to declaration" })
	k.set(
		"n",
		"gd",
		"<cmd>Lspsaga peek_definition<CR>",
		opts,
		{ desc = "Lspsaga: see definition and make edits in window" }
	)
	k.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts, { desc = "Lspsaga: go to implementation" })
	k.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts, { desc = "Lspsaga: see available code actions" })
	k.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts, { desc = "Lspsaga: smart rename" })
	k.set(
		"n",
		"<leader>D",
		"<cmd>Lspsaga show_line_diagnostics<CR>",
		opts,
		{ desc = "Lspsaga: show  diagnostics for line" }
	)
	k.set(
		"n",
		"<leader>d",
		"<cmd>Lspsaga show_cursor_diagnostics<CR>",
		opts,
		{ desc = "Lspsaga: show diagnostics for cursor" }
	)
	k.set(
		"n",
		"[d",
		"<cmd>Lspsaga diagnostic_jump_prev<CR>",
		opts,
		{ desc = "Lspsaga: jump to previous diagnostic in buffer" }
	)
	k.set(
		"n",
		"]d",
		"<cmd>Lspsaga diagnostic_jump_next<CR>",
		opts,
		{ desc = "Lspsaga: jump to next diagnostic in buffer" }
	)
	k.set(
		"n",
		"K",
		"<cmd>Lspsaga hover_doc<CR>",
		opts,
		{ desc = "Lspsaga: show documentation for what is under cursor" }
	)
	k.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts, { desc = "Lspsaga: see outline on right hand side" })

	-- typescript specific keymaps (e.g. rename file and update imports)
	if client.name == "tsserver" then
		k.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", { desc = "rename file and update imports" })
		k.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", { desc = "organize imports" })
		k.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", { desc = "remove unused variables" })
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
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

lspconfig["intelephense"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		intelephense = {
			stubs = {
				"Core",
				"SPL",
				"imagick",
				"standard",
				"pcre",
				"date",
				"json",
				"ctype",
				"SimpleXML",
				"Reflection",
			},
		},
	},
})

lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["elixirls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
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
