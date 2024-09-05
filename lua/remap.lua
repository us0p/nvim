vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- map to move current line up or down;
vim.keymap.set("v", "J", ":m .+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m .-2<CR>gv=gv")

-- map to keep cursor at the center of the screen when srolling the page;
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u", "<C-u>zz")

-- stores selected text to clipboard;
vim.keymap.set("v", "<leader>y", [["+y]])
