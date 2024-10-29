vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({"v", "n"}, "<leader>y", "\"+y")
vim.keymap.set({"v", "n"}, "<leader>Y", "\"+Y")
