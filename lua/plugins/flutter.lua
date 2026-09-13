return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- nicer UI for device/emulator pickers
    },
    opts = {
      -- flutter auto-detected from PATH (fvm global stable)
      fvm = false,
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "Comment",
        prefix = "// ",
        enabled = true,
      },
      dev_log = {
        enabled = true,
        open_cmd = "tabedit",
      },
      outline = {
        open_cmd = "30vnew",
      },
      lsp = {
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          updateImportsOnRename = true,
        },
      },
      debugger = {
        enabled = true,
      },
    },
  },
}