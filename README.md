# Details

the package manager used is  
[lazy.nvim](https://lazy.folke.io/)  

if you need some plugins, you can look at a list available at the pre-mounted project  
[LazyVim](https://www.lazyvim.org/)  

the lsp provider is  
[lsp-zero.nvim](https://lsp-zero.netlify.app/docs/introduction.html)

# Dependencies
- [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation): search tool, telescope dependency.
- black: Python formatter > Mason.
- prettierd: JS formatter > Mason.
- stylua: Lua formatter > Mason.
- shfmt: Shell script formatter > Mason.
- clang-format - C/C++ formatter > Mason.

# Todo  
- (lsp) <C-n> is overriding harpoon <C-n> keymap.
- (catpuccin) add a theme with [gruvbox colorscheme](https://github.com/morhetz/gruvbox).
- (neo-tree) you don't really need fuzzy finder functionality, the goal was find a plugin that provided a better UI than netrw.
- (neo-tree) / should behave like in netrw.
- (neo-tree) should be possible to walk the directories, not current one only.
- (neo-tree) replace neo-tree keybidings with netrw.
- (neo-tree) when creating a new file it should open a buffer with the file created.
- (neo-tree && lualine) add icon support.
- (lualine) should follow colorscheme colors.
- (mason) is there a way to ensure installed linters and formatters or it's valid only for language server providers?
