local setup, laravel = pcall(require, "laravel")
if not setup then
  return
end

laravel.setup({
  lsp_server = "intelephense",
})
require("telescope").load_extension("laravel")
