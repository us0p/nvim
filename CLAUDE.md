# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration managed as a git repository. The plugin manager is [lazy.nvim](https://lazy.folke.io/). All configuration is written in Lua.

## Setup

Run `./setup.sh` to install system dependencies (Arch Linux / pacman assumed). It installs: unzip, ripgrep, clang, go, nvm (Node/LTS), pyenv (latest Python), and Cargo/Rust (for `tree-sitter-cli`).

For other distros, install the equivalent packages manually. On Debian, also install `python3-pip` and `python3-venv`.

Additional manual steps:
- Build Neovim from source (avoids cross-distro package inconsistencies)
- Install NerdFonts (shallow-clone the repo and run the install script)
- Install `tiktoke_core` for CopilotChat token counting (Arch: `luajit-tiktoken-bin` from AUR)
- Install `lynx` for improved URL context features in CopilotChat

## Architecture

```
init.lua                     # Entry point: loads keymaps, options, lazy
lua/config/
  keymaps.lua                # Leader key (<Space>) + all global keymaps
  options.lua                # vim.opt settings (indent, undo, scroll, etc.)
  lazy.lua                   # Bootstraps lazy.nvim and imports lua/plugins/
lua/plugins/
  *.lua                      # One file per plugin (or plugin group)
stylua.toml                  # Lua formatter config (75 col, 4-space indent)
lazy-lock.json               # Plugin version lockfile — commit this
```

Each file in `lua/plugins/` returns a lazy.nvim plugin spec (a table or array of tables). lazy.nvim auto-discovers all files under `lua/plugins/` via `{ import = "plugins" }` in `lazy.lua`.

## Key plugins and their roles

| Plugin | File | Purpose |
|--------|------|---------|
| lsp-zero v4 + mason | `lsp.lua` | LSP, auto-install servers via Mason |
| mason-tool-installer | `lsp.lua` | Auto-install formatters/linters |
| conform.nvim | `conform.lua` | Format-on-save |
| nvim-lint | `nvim-lint.lua` | Lint on save/read/insert-leave |
| nvim-cmp | `lsp.lua` | Completion (LSP source only) |
| Telescope | `telescope.lua` | File finder + grep |
| Harpoon2 | `harpoon.lua` | Quick file navigation (up to 4 slots) |
| Treesitter | `treesitter.lua` | Syntax/indent, auto-installs parsers |
| catppuccin | `catppuccin.lua` | Colorscheme (Mocha + Gruvbox palette overrides) |
| lualine | `lualine.lua` | Statusline with bubbles theme |

## LSP servers (auto-installed by Mason)

clangd, bashls, cssls, dockerls, docker_compose_language_service, gopls, html, htmx, jsonls, lua_ls, autotools_ls, pyright, sqlls

## Formatters and linters

- **Lua**: stylua (75-col, 4-space, config at `stylua.toml`)
- **Shell**: shfmt (2-space indent)
- **C**: clang-format
- **Python**: black (75-char line length), flake8
- **JavaScript/TypeScript**: prettierd (format), eslint_d (lint)

Format-on-save is active for all configured filetypes. Linting triggers on `BufWritePost`, `BufReadPost`, and `InsertLeave`.

## Keymaps reference

| Mode | Key | Action |
|------|-----|--------|
| n | `<Space>pv` | Open netrw (file explorer) |
| n | `<Space>pf` | Telescope: find files |
| n | `<Space>ps` | Telescope: grep string |
| v | `J` / `K` | Move selected lines down/up |
| n | `<C-d>` / `<C-u>` | Scroll half-page (cursor centered) |
| v | `<Space>y` | Yank to system clipboard |
| n | `K` | LSP hover |
| n | `gd` | LSP go to definition |
| n | `<Space>vd` | Open diagnostic float |
| n | `[d` / `]d` | Next/prev diagnostic |
| n | `<Space>a` | Harpoon: add file |
| n | `<C-e>` | Harpoon: toggle quick menu |
| n | `<C-h/t/n/s>` | Harpoon: jump to slot 1–4 |
| n | `<C-p>` / `<C-n>` | cmp: prev/next completion item |
| n | `<C-y>` | cmp: confirm completion |
| n | `<C-Space>` | cmp: trigger completion |

## Adding a new plugin

Create a new file in `lua/plugins/` that returns a valid lazy.nvim spec. It will be auto-imported. Pin versions with `tag` or `commit` when stability matters; use `build` for plugins that require a compile step.

## Todo (from README)

- Configure formatters to break lines longer than 75 characters for remaining filetypes.
- Configure pylint (currently disabled — noisy about docstrings and imports).
