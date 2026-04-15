return {
  {
    "saghen/blink.cmp",
    opts = {
      -- 1. Ensure the first item is automatically highlighted
      completion = {
        list = {
          selection = { preselect = true, auto_insert = true },
        },
      },
      -- 2. Map Space (or any key) to accept the selection
      keymap = {
        preset = "default",
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        -- Use "select_and_accept" so it picks the preselected item
        ["<Space>"] = { "select_and_accept", "fallback" },
        -- Or use Enter if you prefer
        ["<CR>"] = { "accept", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
