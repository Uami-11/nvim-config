return {

    -- Mason: auto-install all LSPs and tools
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                -- LSP servers
                "pyright",
                "ruff",
                "gopls",
                "omnisharp",
                "clangd",
                "jdtls",
                "html-lsp",
                "css-lsp",
                "bash-language-server",
                "lua-language-server",
                -- Formatters
                "black",
                "gofumpt",
                "shfmt",
                "prettier",
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
                        },
                    },
                },
                -- Godot C# via GDScript LSP (connect to running Godot editor)
                gdscript = {},
            },
        },
    },

    -- Treesitter: syntax highlighting for all languages
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "python",
                "go",
                "c_sharp",
                "c",
                "cpp",
                "java",
                "javascript",
                "tsx",
                "html",
                "css",
                "bash",
                "lua",
                "gdscript",
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
    -- conform.nvim: formatting (semicolon removal in Python is ruff/black)
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_format", "ruff_organize_imports" },
                go = { "gofumpt" },
                cs = { "csharpier" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                java = { "google-java-format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                sh = { "shfmt" },
                lua = { "stylua" },
            },
        },
    },
}
