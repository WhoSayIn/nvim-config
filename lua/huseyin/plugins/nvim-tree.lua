return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")
    local k = vim.keymap
    local api = require("nvim-tree.api")

    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.nvim_tree_disable_netrw = 0

    -- change color for arrows in tree to light blue
    -- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    function Grep_at_current_tree_node()
      local node = require("nvim-tree.lib").get_node_at_cursor()
      if not node then
        return
      end
      require("telescope.builtin").live_grep({ search_dirs = { node.absolute_path } })
    end

    function Find_at_current_tree_node()
      local node = require("nvim-tree.lib").get_node_at_cursor()
      if not node then
        return
      end
      require("telescope.builtin").find_files({ search_dirs = { node.absolute_path } })
    end

    local function on_attach(bufnr)
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
      k.set("n", "<space>fs", ":lua Grep_at_current_tree_node()<CR>", opts("git add"))
      k.set("n", "<space>ff", ":lua Find_at_current_tree_node()<CR>", opts("git add"))

      -- to look good with Solarized theme
      vim.cmd("hi NvimTreeNormal guibg=#001f2f")

      -- open the file you just created
      api.events.subscribe(api.events.Event.FileCreated, function(file)
        vim.cmd("edit " .. file.fname)
      end)
    end
    nvimtree.setup({
      view = {
        width = 35,
      },
      on_attach = on_attach,
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store", "^.git$", "__pycache__", ".pytest_cache" },
      },
      git = {
        ignore = false,
      },
    })

    -- prevent focusing on nvimtree full screen after a :bdelete
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
          vim.defer_fn(function()
            api.tree.toggle({ find_file = true, focus = true })
            api.tree.toggle({ find_file = true, focus = true })
            vim.cmd("wincmd p")
          end, 0)
        end
      end,
    })

    -- keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    -- keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

    k.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    k.set("n", "<leader>cf", ":NvimTreeFindFile<CR>", { desc = "Focus on open file in NvimTree" })
  end,
}
