local setup, lualine = pcall(require, "lualine")
if not setup then
	return
end

local theme = require("lualine.themes.solarized")

lualine.setup({
	options = {
		theme = theme,
		globalstatus = true,
	},
})
