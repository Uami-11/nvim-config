return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false }, -- Keeps those ghost hints away
      servers = {
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
