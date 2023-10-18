return {
  "nvim-lua/plenary.nvim",
  "christoomey/vim-tmux-navigator",
  "szw/vim-maximizer",
  "inkarkat/vim-ReplaceWithRegister",
  "tpope/vim-surround",
  "mbbill/undotree",
  "lukas-reineke/indent-blankline.nvim",
  "jose-elias-alvarez/typescript.nvim",
  "onsails/lspkind.nvim",
  "ray-x/lsp_signature.nvim",
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  "sindrets/diffview.nvim",
  {
    "tpope/vim-rhubarb", -- for GBrowse of vim-fugitive to work}
    dependencies = {
      { "tpope/vim-fugitive" },
    },
  },
  "MunifTanjim/nui.nvim",
  "dpayne/CodeGPT.nvim",
  "cappyzawa/starlark.vim",
}
