return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
                library = {
                  "/usr/share/love",
                  "${3rd}/love2d/library",
                },
              },
            },
          },
        },
      },
    },
  },
}
