return {

  -- Mason: auto-install LSP servers and tools.
  -- NOTE: LazyVim passes its computed server list to mason-lspconfig, but it
  -- comes back empty in practice (verified), so servers must be listed here.
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP servers
        "pyright",
        "ruff",
        "gopls",
        "clangd",
        "html-lsp",
        "css-lsp",
        "bash-language-server",
        "lua-language-server",
        "postgres-language-server",
        -- Formatters / linters
        "prettier",
        "latexindent",
        "sqlfluff",
        "gdtoolkit",
      },
    },
  },
  -- nvim-lspconfig: extra servers not covered by LazyVim extras
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {},
        bashls = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enabled = false },
              completion = { callSnippet = "Disable" },
            },
          },
        },
        -- GDScript (connect to running Godot editor)
        gdscript = {},
        -- PostgreSQL
        postgres_lsp = {},
      },
    },
  },

  -- nvim-lint: SQL linting via sqlfluff with PostgreSQL dialect
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local sql_ft = { "sql", "mysql", "plsql" }
      for _, ft in ipairs(sql_ft) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        table.insert(opts.linters_by_ft[ft], "sqlfluff")
      end
      opts.linters = opts.linters or {}
      opts.linters.sqlfluff = {
        args = { "lint", "--format=json", "--dialect=postgres", "-" },
      }
    end,
  },

  -- Treesitter: syntax highlighting for all languages.
  -- Lists merge with LazyVim core + extras (opts_extend), so only list the
  -- parsers that aren't covered elsewhere: css, GDScript and SQL.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        enable = true,
        disable = { "gdscript" },
      },
      ensure_installed = {
        "css",
        "gdscript",
        "sql",
      },
    },
  },
  -- conform.nvim: formatting (Python semicolon/import cleanup is ruff's job)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_format", "ruff_organize_imports" },
        go = { "gofumpt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        sh = { "shfmt" },
        lua = { "stylua" },
        json = { "prettier" },
        jsonc = { "prettier" },
        tex = { "latexindent" },
        sql = { "sqlfluff" },
        mysql = { "sqlfluff" },
        plsql = { "sqlfluff" },
        gdscript = { "gdformat" },
      },
      formatters = {
        sqlfluff = {
          args = { "format", "--dialect=postgres", "-" },
        },
      },
    },
  },
  {
    "myriad-dreamin/tinymist",
    ft = "typst",
    config = function()
      require("lspconfig").tinymist.setup({
        settings = {
          exportPdf = "onType",
          formatterMode = "typstyle",
        },
      })
    end,
  },
}
