return {

  -- Catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = true, -- shows wallpaper through nvim
      show_end_of_buffer = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        telescope = { enabled = true, style = "nvchad" },
        which_key = true,
        mason = true,
        mini = { enabled = true },
      },
    },
  },

  -- Set it as the default colorscheme (overrides LazyVim default)
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
