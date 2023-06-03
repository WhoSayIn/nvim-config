local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local k = vim.keymap

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local git_add = function()
    local node = api.tree.get_node_under_cursor()
    local gs = node.git_status.file

    if gs == nil then
      gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
          or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
    end

    if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
      vim.cmd("silent !git add " .. node.absolute_path)
    elseif gs == "M " or gs == "A " then
      vim.cmd("silent !git restore --staged " .. node.absolute_path)
    end

    api.tree.reload()
  end

  api.config.mappings.default_on_attach(bufnr)

  k.set("n", "A", api.tree.expand_all, opts("Expand All"))
  k.set("n", "?", api.tree.toggle_help, opts("Help"))
  k.set("n", "C", api.tree.change_root_to_node, opts("CD"))
  k.set("n", "Z", api.node.run.system, opts("Run System"))
  k.set("n", "ga", git_add, opts("git add"))
  k.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
  k.set("n", "<leader>cf", ":NvimTreeFindFile<CR>", { desc = "Focus on open file in NvimTree" })

  vim.cmd("hi NvimTreeNormal guibg=#001f2f") -- to look good with Solarized theme
end

nvimtree.setup({
  on_attach = on_attach,
  filters = {
    custom = { ".git" },
  },
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
