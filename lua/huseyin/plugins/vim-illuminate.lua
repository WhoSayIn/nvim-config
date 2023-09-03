return {
  "RRethy/vim-illuminate",
  config = function()
    local illuminate = require("illuminate")
    illuminate.configure({
      filetypes_denylist = {
        "NvimTree",
      },
    })
  end,
}
