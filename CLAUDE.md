# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration built on lazy.nvim plugin manager. Configuration follows a modular structure with individual plugin files and centralized options/keymaps.

## Configuration Architecture

**Entry Point**: `init.lua` loads in order:
1. `taha.opt` - Vim options and settings
2. `taha.remap` - Global keymaps (leader key MUST be set before lazy)
3. `taha.lazy` - Plugin manager bootstrap and plugin loading

**Plugin Loading**: All plugins in `lua/taha/plugins/*.lua` are automatically imported via lazy.nvim's spec import system. Simple plugins can also be defined inline in `lua/taha/lazy.lua`.

**Key Files**:
- `lua/taha/opt.lua` - Core editor settings (numbers, indentation, clipboard, search behavior)
- `lua/taha/remap.lua` - Global keymaps and leader key definition
- `lua/taha/lazy.lua` - Lazy.nvim setup and simple plugin definitions
- `lua/taha/plugins/` - Individual plugin configurations

## Language Server Configuration

LSP setup in `lua/taha/plugins/lspconfig.lua` uses Mason for installation. Configured servers:
- **Go**: gopls
- **Lua**: lua_ls (Neovim development optimized with lazydev)
- **Python**: pyright
- **Ruby**: ruby_lsp
- **TypeScript/JavaScript**: ts_ls
- **C/C++**: clangd
- **PHP**: phpactor (not intelephense)
- **Dart**: dartls (Flutter path: `/home/taha/flutter/bin/dart`)
- **Angular**: angularls

Mason does NOT auto-install servers. Add servers to the `servers` table in lspconfig.lua, then manually run `:Mason` to install.

## Formatting and Linting

`lua/taha/plugins/none-ls.lua` (null-ls) handles formatting:
- **Lua**: stylua
- **Ruby**: rubocop (system-installed, not bundler version, with `--force-exclusion`)
- **PHP**: blade_formatter, pint
- **PHP Diagnostics**: phpstan
- **HTML**: htmlbeautifier
- **JavaScript/TypeScript/JSON/etc**: prettier
- **Spell Check**: cspell (optional, checks if installed via `vim.fn.executable`)

Keymaps:
- `<leader>fc` - Format current buffer
- `<leader>ww` - Format and save all buffers

## Important Keymaps

**Leader Key**: `<Space>`

**File Navigation**:
- `<leader>pv` - Toggle nvim-tree file explorer
- `<leader>pf` - Find current file in nvim-tree
- `<C-p>` - Telescope git files
- `<leader>ff` - Telescope find files
- `<leader>sg` - Telescope live grep
- `<leader><leader>` - Telescope buffers

**Harpoon** (quick file bookmarks):
- `<leader>a` - Add file to harpoon
- `<C-e>` - Toggle harpoon quick menu
- `<C-j>` - Previous harpoon file
- `<C-k>` - Next harpoon file

**LSP** (when attached):
- `<leader>gd` - Go to definition (Telescope)
- `<leader>gr` - Go to references (Telescope)
- `<leader>gi` - Go to implementation (Telescope)
- `<leader>r` - Rename symbol
- `<leader>ca` - Code action
- `K` - Hover documentation
- `<leader>h` - Toggle inlay hints

**Code Movement**:
- `<C-d>` / `<C-u>` - Half page down/up (centered)
- `n` / `N` - Next/previous search (centered)
- `J` (visual) - Move line down with reindent
- `K` (visual) - Move line up with reindent
- `J` (normal) - Join lines (cursor stays in place)

**Editing**:
- `<leader>fr` - Find and replace word under cursor
- `<leader>y` / `<leader>d` - Yank/delete to m register (not system clipboard)
- `<leader>vv` - Select all
- `<leader>ee` - Insert Go error handling snippet

**Telescope Search**:
- `<leader>sh` - Search help tags
- `<leader>sk` - Search keymaps
- `<leader>sd` - Search diagnostics
- `<leader>sn` - Search Neovim config files
- `<leader>/` - Fuzzy search in current buffer

## Plugin Highlights

- **nvim-tree**: File explorer (not neo-tree, even though neo-tree plugin file exists)
- **Telescope**: Fuzzy finder with fzf-native extension
- **Treesitter**: Syntax highlighting for many languages (auto-install enabled)
- **nvim-cmp**: Autocompletion with LSP, LuaSnip, and path completion
- **Harpoon2**: Fast file navigation via bookmarks
- **copilot.lua**: GitHub Copilot integration
- **vim-sleuth**: Auto-detect indentation
- **nvim-surround**: Surround text objects
- **gitsigns**: Git integration

## Development Notes

- Swap files are disabled (`vim.o.swapfile = false`)
- Clipboard synced with system (`clipboard = "unnamedplus"`)
- Undo history persisted between sessions
- Default indentation: 4 spaces (tabs disabled)
- Line wrap disabled
- Scroll offset: 10 lines above/below cursor
- Relative line numbers enabled
- Nerd Font required for proper icon display

## Treesitter Languages

Pre-configured parsers: bash, c, html, lua, markdown, dart, javascript, typescript, go, python, ruby, php, blade

## Colorscheme

Currently: **rose-pine** (italics disabled)
Alternative (commented): catppuccin-mocha

## Diagnostic Configuration

- Only ERROR severity shows underlines
- Diagnostic signs use nerd font icons
- Sorted by severity
- Floating windows have rounded borders
- Virtual text shows diagnostic message for all severities
