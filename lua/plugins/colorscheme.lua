return {
  -- Custom GameMaker Studio 2 (classic dark) theme, defined in
  -- lua/gamemaker/init.lua + colors/gamemaker.lua
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "gamemaker" },
  },
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true, -- Enable transparency
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
