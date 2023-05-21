-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")

  use("ishan9299/nvim-solarized-lua")

  use("christoomey/vim-tmux-navigator")
  use("szw/vim-maximizer")
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")
  use("numToStr/Comment.nvim")
  use("nvim-tree/nvim-tree.lua")
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
  use("mbbill/undotree")
  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
  use("lukas-reineke/indent-blankline.nvim")
  use("RRethy/vim-illuminate")

  -- autocomplete
  use("hrsh7th/nvim-cmp")    -- completion plugin
  use("hrsh7th/cmp-buffer")  -- source for text in buffer
  use("hrsh7th/cmp-path")    -- source for file system paths
  use("hrsh7th/cmp-cmdline") -- source for commandline
  use("hrsh7th/cmp-nvim-lua") -- source for file system paths
  use("hrsh7th/cmp-nvim-lsp")
  use("lukas-reineke/cmp-under-comparator")

  -- snippets
  use("L3MON4D3/LuaSnip")            -- snippet engine
  use("saadparwaiz1/cmp_luasnip")    -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- manage lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configure lsp servers
  use("neovim/nvim-lspconfig")
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use("jose-elias-alvarez/typescript.nvim")
  use("onsails/lspkind.nvim")
  use("ray-x/lsp_signature.nvim")
  use({
    "SmiteshP/nvim-navbuddy",
    requires = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
  })

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")
  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs")
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  -- git
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("sindrets/diffview.nvim")
  use("tpope/vim-rhubarb") -- for GBrowse of vim-fugitive to work
  use("folke/which-key.nvim")
  use("MunifTanjim/nui.nvim")
  use("dpayne/CodeGPT.nvim")
  use("https://git.sr.ht/~whynothugo/lsp_lines.nvim")
  -- use("Maan2003/lsp_lines.nvim")

  use({
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
  })
  use({
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  })

  use("CRAG666/code_runner.nvim")
  use({
    "akinsho/toggleterm.nvim",
    tag = "*",
  })
  use("j-hui/fidget.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
