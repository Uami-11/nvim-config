return {
  {
    "ThePrimeagen/99",
    keys = {
      {
        "<leader>9v",
        function()
          require("99").visual({})
        end,
        mode = "v",
        desc = "99: Visual",
      },
      {
        "<leader>9x",
        function()
          require("99").stop_all_requests()
        end,
        mode = "n",
        desc = "99: Stop all requests",
      },
      {
        "<leader>9s",
        function()
          require("99").search({})
        end,
        mode = "n",
        desc = "99: Search",
      },
    },
    config = function()
      local _99 = require("99")
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)
      _99.setup({
        model = "opencode/big-pickle",
        logger = {
          level = _99.DEBUG,
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },
        completion = {
          custom_rules = {},
        },
        md_files = {
          "AGENT.md",
        },
        tmp_dir = "./tmp",
      })
    end,
  },
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
}
