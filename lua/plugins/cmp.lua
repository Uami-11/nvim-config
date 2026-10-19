return {
  {
    "saghen/blink.cmp",
    opts = {
      -- 1. Ensure the first item is automatically highlighted
      -- but never insert it until explicitly accepted (auto_insert = false)
      completion = {
        -- No inline preview of the selected item in the editor
        ghost_text = { enabled = false },
        list = {
          selection = { preselect = true, auto_insert = true },
        },
      },
      -- 2. Map Space (or any key) to accept the selection
      keymap = {
        preset = "default",
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        -- Or use Enter if you prefer
        ["<CR>"] = { "accept", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
