return {
  -- No Mason: LSP servers and tools are installed system-wide (emerge/portage)
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },

  -- nvim-lspconfig: servers not covered by the clangd/rust extras
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
      },
    },
  },

  -- Treesitter: syntax highlighting for kept languages + config formats
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "lua",
        "c",
        "cpp",
        "rust",
        "vim",
        "vimdoc",
        "json",
        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
      },
    },
  },

  -- conform.nvim: formatting (all binaries come from the system)
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        rust = { "rustfmt" },
      },
    },
  },
}
