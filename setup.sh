#! /bin/bash
set -e

mkdir -p "$HOME/packages"
cd "$HOME/packages"

sudo pacman -Sy \
  unzip \
  ripgrep \
  go

export PROFILE="$HOME/.zshrc"

# Install NVM
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Install Pyenv
curl -fsSL https://pyenv.run | bash

# Addin pyenv startup commands
echo 'export PYENV_ROOT="$HOME/.pyenv"' >>~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >>~/.zshrc
echo 'eval "$(pyenv init - zsh)"' >>~/.zshrc

# Install Cargo
curl https://sh.rustup.rs -sSf | sh

# Load nvm into the shell
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

# Loading pyenv into the shell
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)" 2>/dev/null || true

# Load Cargo into PATH
export PATH="$HOME/.cargo/bin:$PATH"

# install latest node version and set's it as default
nvm install --lts
nvm alias default lts/*

# install latest stable python
latest_python="$(
  pyenv install --list |
    sed 's/^[[:space:]]*//' |
    grep -E '^3\.[0-9]+\.[0-9]+$' |
    tail -1
)"
pyenv install -s "$latest_python"
pyenv global "$latest_python"

# installing nvim-treesitter dependency
cargo install --locked tree-sitter-cli
