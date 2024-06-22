return {
  {
    "ishan9299/nvim-solarized-lua",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd("colorscheme solarized")
      vim.cmd("hi CursorLineNr guifg=#ffffff guibg=#001f2f cterm=bold") -- make the line number I'm at white
      vim.cmd("hi NvimTreeNormal guibg=#001f2f")
    end,
  },
}
