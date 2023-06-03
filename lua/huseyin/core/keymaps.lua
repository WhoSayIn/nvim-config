vim.g.mapleader = " "

local k = vim.keymap

-- general
k.set("i", "jj", "<ESC>")
k.set("n", "<F4>", ":nohl<CR>")
k.set("n", "x", '"_x')              -- x should delete but not copy

k.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected lines up and down
k.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected lines up and down

k.set("n", "J", "mzJ`z")            -- J merges next line but keeps the cursor where it is
k.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace the word I'm on" })

k.set("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })
k.set("n", "<leader>bo", ":%bd|e#<CR>", { desc = "Close all buffers but the current one" })

-- clipboard
k.set("x", "<leader>p", '"_dP', { desc = "paste over something without copying deleted text" })
k.set("n", "<leader>y", '"+y', { desc = "yank into system clipboard" })
k.set("v", "<leader>y", '"+y', { desc = "yank into system clipboard" })
k.set("n", "<leader>Y", '"+Y', { desc = "yank into system clipboard" })
k.set("v", "y", "ygv<ESC>", { desc = "yank, but not move the cursor back" })

-- window management
k.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
k.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
k.set("n", "<leader>se", "<C-w>=", { desc = "make split windows equal width & height" })
k.set("n", "<leader>sx", ":close<CR>", { desc = "close current split window" })

k.set("n", "<leader>to", ":tabnew<CR>", { desc = "open new tab" })
k.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close current tab" })
k.set("n", "<leader>tn", ":tabn<CR>", { desc = "go to next tab" })
k.set("n", "<leader>tp", ":tabp<CR>", { desc = "go to previous tab" })

-- plugin keymaps
k.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "Maximize" })
k.set("n", "<leader>u", ":UndotreeToggle<CR>")
k.set("v", "<leader>sg", ":<C-U>GoogleSearch<CR>")
