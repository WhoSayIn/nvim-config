return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    indent = {
      indent = {
        enabled = true,
        char = "┊",
      },
      animate = {
        enabled = false,
      },
    },
  },
  keys = {
    -- bufdelete
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete buffer",
    },
    {
      "<leader>bD",
      function()
        Snacks.bufdelete.all()
      end,
      desc = "Delete all buffers",
    },
    {
      "<leader>bo",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Delete other buffers",
    },
    -- gitbrowse
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Open file on github/gitlab/bitbucket",
    },
  },
}
