return {
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_method = "zathura"

      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        build_dir = "build",
        out_dir = "build",
        aux_dir = "build",
        options = {
          "-xelatex",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
        "Package hyperref Warning",
      }
      vim.g.vimtex_log_ignore = {
        "Underfull",
        "Overfull",
      }
    end,
    keys = {
      { "<leader>pw", "<cmd>!pandoc % -o %.docx<CR>", desc = "Convert to DOCX", ft = "tex" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    optional = true,
    opts = {
      servers = {
        texlab = {
          settings = {
            texlab = {
              build = { onSave = false },
              chktex = {
                onEdit = false,
                onOpenAndSave = false,
              },
              diagnosticsDelay = 300,
            },
          },
        },
      },
    },
  },
}
