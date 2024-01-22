return {
  "nvim-telescope/telescope.nvim",
  -- branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")

    -- set keymaps
    local k = vim.keymap

    k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
    k.set("n", "<leader>fe", "<cmd>Telescope oldfiles cwd_only=true<cr>")
    k.set("n", "<leader>fs", "<cmd>Telescope live_grep_args<cr>")
    k.set("n", "<leader>fc", "<cmd>Telescope commands<cr>")
    k.set("v", "<leader>fc", "<cmd>Telescope git_bcommits_range<cr>")
    k.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>")
    k.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
    k.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
    k.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
    k.set("n", "<leader>fa", "<cmd>Telescope builtin<cr>")
    k.set("n", "<leader>fr", "<cmd>Telescope git_branches<cr>")
    k.set("n", "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
    k.set("n", "<leader>/", "<cmd>Telescope search_history<cr>")
    k.set("n", "<leader>:", "<cmd>Telescope command_history<cr>")
    k.set("n", ";", "<cmd>Telescope resume<cr>")

    require("huseyin.private.telescope.picker.repository")
  end,
}
