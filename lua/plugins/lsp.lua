return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false }, -- Keeps those ghost hints away
      servers = {
        -- GameMaker Language (GML)
        gmlls = {
          cmd = { "gmlls" },
          filetypes = { "gml" },
          root_markers = { "*.yyp", ".git" },
          init_options = { gmlSpec = vim.fn.expand("~/.config/gmlls/GmlSpec.xml") },
        },
        -- Configuration for Go
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = false, -- This stops the actual text filling
            },
          },
        },
        -- Keep your ccls config here as well if you use it
        ccls = {
          init_options = {
            completion = { placeholder = false },
          },
        },
      },
    },
  },
}
