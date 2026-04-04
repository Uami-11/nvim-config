return {
  -- DeepSeek for questions and thinking
  {
    "David-Kunz/gen.nvim",
    opts = {
      model = "deepseek-r1:8b",
      host = "localhost",
      port = "11434",
      display_mode = "split",
      show_prompt = true,
      show_model = true,
      no_auto_close = false,
    },
  },
  -- Primeagen's 99
  {
    "ThePrimeagen/99",
    config = function()
      local _99 = require("99")
      _99.setup({
        logger = {
          level = _99.DEBUG,
          path = "/tmp/99.debug",
          print_on_error = true,
        },
        tmp_dir = "./tmp",
        completion = {
          source = "native",
        },
        md_files = {
          "AGENT.md",
        },
      })

      vim.keymap.set("v", "<leader>9v", function()
        _99.visual()
      end)

      vim.keymap.set("n", "<leader>9x", function()
        _99.stop_all_requests()
      end)

      vim.keymap.set("n", "<leader>9s", function()
        _99.search()
      end)
    end,
  },
}
