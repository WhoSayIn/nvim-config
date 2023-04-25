local o = vim.opt

-- line numbers
o.relativenumber = true
o.number = true

-- tabs & indentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- line wrapping
o.wrap = false

-- search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- cursor line
o.cursorline = true

-- appearance
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"
o.scrolloff = 8
o.colorcolumn = "80"

-- history
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- backspace
o.backspace = "indent,eol,start"

-- split windows
o.splitright = true
o.splitbelow = true

o.updatetime = 300
-- o.iskeyword:append("-")
