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

    k.set("n", "<leader>ff", ":Telescope find_files<cr>")
    k.set("n", "<leader>fe", ":Telescope oldfiles cwd_only=true<cr>")
    k.set("n", "<leader>fs", ":Telescope live_grep_args<cr>")
    k.set("n", "<leader>fc", ":Telescope commands<cr>")
    k.set("n", "<leader>fg", ":Telescope grep_string<cr>")
    k.set("n", "<leader>fb", ":Telescope buffers<cr>")
    k.set("n", "<leader>fh", ":Telescope help_tags<cr>")
    k.set("n", "<leader>fk", ":Telescope keymaps<cr>")
    k.set("n", "<leader>fa", ":Telescope builtin<cr>")
    k.set("n", "<leader>fl", ":Telescope current_buffer_fuzzy_find<cr>")
    k.set("n", "<leader>/", ":Telescope search_history<cr>")
    k.set("n", "<leader>:", ":Telescope command_history<cr>")
    k.set("n", ";", ":Telescope resume<cr>")

    require("huseyin.private.telescope.picker.repository")
  end,
}
