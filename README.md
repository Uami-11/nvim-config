# Neovim Configuration

My personal Neovim setup started with[LazyVim](https://github.com/LazyVim/LazyVim)


## Features

### Language Support

| Language | LSP | Formatter | Treesitter |
|---|---|---|---|
| Python | pyright, ruff | ruff_format, ruff_organize_imports | ✓ |
| Go | gopls | gofumpt | ✓ |
| C# | omnisharp | csharpier | ✓ |
| C/C++ | clangd, ccls | clang_format | ✓ |
| Java | jdtls | google-java-format | ✓ |
| TypeScript/JS | ts_ls | prettier | ✓ |
| HTML/CSS | html-lsp, css-lsp | prettier | ✓ |
| Lua | lua-language-server | stylua | ✓ |
| Bash | bash-language-server | shfmt | ✓ |
| GDScript (Godot) | gdscript | — | ✓ |
| Typst | tinymist | typstyle | — |

### Completion (blink.cmp)

Sources: LSP, path, snippets, buffer.

| Key | Action |
|---|---|
| `<C-j>` | Next item |
| `<C-k>` | Previous item |
| `<Space>` | Accept selected |
| `<CR>` | Accept |

### AI Tools

- **ThePrimeagen/99** — AI coding assistant configured with `opencode/big-pickle`. Keymaps: `<leader>9v` (visual), `<leader>9s` (search), `<leader>9x` (stop all).
- **gen.nvim** — Local Ollama integration using `deepseek-r1:8b` on `localhost:11434`, displayed in a split.

### Appearance

- **Colorschemes:** TokyoNight and Catppuccin, both with full transparency enabled.
- **Telescope:** All Telescope windows (normal, prompt, results, preview) are forced transparent on every colorscheme load via an autocmd.
- **Dashboard:** Custom `dashboard-nvim` with an ASCII "YAMI VIM" logo and standard LazyVim shortcuts.
- **winblend:** Set to `0` globally for fully opaque floating windows outside Telescope.

### Editor Settings

- **Tab width:** 4 spaces (`shiftwidth = 4`, `tabstop = 4`, `expandtab = true`)
- **Inlay hints:** Disabled
- **Go placeholders:** `usePlaceholders = false` in gopls
- **Flash.nvim:** `s` key unbound in normal/visual/operator modes
