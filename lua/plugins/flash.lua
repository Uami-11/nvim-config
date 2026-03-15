return {
  {
    "folke/flash.nvim",
    keys = {
      -- Disable the 's' key in normal, visual, and operator modes
      { "s", mode = { "n", "x", "o" }, false },
      -- You can optionally add a new keymap for flash.nvim here if desired
      -- { "S", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },
}
