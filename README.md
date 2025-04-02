# Details

the package manager used is  
[lazy.nvim](https://lazy.folke.io/)  

if you need some plugins, you can look at a list available at the pre-mounted project  
[LazyVim](https://www.lazyvim.org/)  

the lsp provider is  
[lsp-zero.nvim](https://lsp-zero.netlify.app/docs/introduction.html)

# Dependencies
Because of inconsistencies accross pakage manger accross linux distros, prefer to build neovim from source.

- [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation): search tool, telescope dependency.
- [NerdFonts](https://github.com/ryanoasis/nerd-fonts): Patched fonts, (shallow copy the repository and run install script).
- [nvm](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating): install npm and node.
- [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html): some packages are written in rust.
- [go](https://go.dev/dl/)
- [pip](https://pip.pypa.io/en/stable/installation/): In debian, it can be installed with `sudo apt install python3-pip`.
- unzip package, it's provided by your distribution package manager.


### Debian - dependencies
- venv: Must install python venv. Can be installed with `sudo apt install python3-venv`.

# Todo
- config formatters to break lines longer than 75 characters.
- config pylint, keep asking to add docstring to functions and modules and complaning about imports.
