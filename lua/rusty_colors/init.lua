local M = {}

function M.load()
  local palette = require("rusty_colors.palette")
  require("rusty_colors.highlights").setup(palette)
  require("rusty_colors.plugins").setup(palette)
  require("rusty_colors.terminal").setup(palette)
end

return M