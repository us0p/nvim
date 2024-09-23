vim.opt.relativenumber = true
vim.opt.number = true

-- number of spaces used for each step of (auto)indent;
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- shouldn't wrap long words;
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8

-- netrw
vim.g.netrw_banner = 0
