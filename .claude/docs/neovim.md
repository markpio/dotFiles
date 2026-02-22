# Neovim Configuration

Path: `~/.config/nvim/`

## Module Structure

| File | Purpose |
|---|---|
| `init.lua` | Plugin loading (vim-plug), global options, autocmds, `require` calls |
| `lua/core/mappings.lua` | All keymaps (leader = `<Space>`) |
| `lua/core/lsp.lua` | nvim-cmp setup, clangd LSP, diagnostic float |
| `lua/core/git-signs.lua` | Gitsigns setup and hunk keymaps |

New modules: create `lua/core/<name>.lua`, add `require( "core.<name>" )` at the bottom of `init.lua`.

## Plugins (vim-plug)

| Plugin | Purpose |
|---|---|
| `telescope.nvim` + `telescope-fzf-native` | Fuzzy finder |
| `nvim-treesitter` | Syntax highlighting |
| `vim-airline` + `vim-airline-themes` | Statusline (theme: base16_gruvbox_dark_hard) |
| `gruvbox.nvim` | **Active colorscheme** (dark) |
| `tokyonight.nvim` | Installed, not active |
| `vim-fugitive` | Git commands |
| `gitsigns.nvim` | Inline git diff/blame |
| `nvim-lspconfig`, `nvim-cmp`, `cmp-nvim-lsp`, `vim-vsnip` | LSP + completion |

## Auto-format on Save

| Pattern | Tool |
|---|---|
| `*.c`, `*.cpp`, `*.h`, `*.hpp` | `clang-format -i` |
| `*.py` | `autopep8 -i` |
| `*.cmake`, `CMakeLists.txt` | `cmake-format -i` |
| All files | Strip trailing whitespace; tabs → 4 spaces |

## Lua Style Conventions

- 4-space indentation
- Spaces inside parens: `require( 'module' )`
- Use `vim.keymap.set()`, always include `desc`
- Group keymaps under a `-- Section` comment header
- Single quotes preferred
