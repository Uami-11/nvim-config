local M = {}

function M.setup(palette)
  vim.g.terminal_color_0 = palette.black
  vim.g.terminal_color_1 = palette.red
  vim.g.terminal_color_2 = palette.green
  vim.g.terminal_color_3 = palette.yellow
  vim.g.terminal_color_4 = palette.blue
  vim.g.terminal_color_5 = palette.magenta
  vim.g.terminal_color_6 = palette.cyan
  vim.g.terminal_color_7 = palette.white
  vim.g.terminal_color_8 = palette.bright_black
  vim.g.terminal_color_9 = palette.bright_red
  vim.g.terminal_color_10 = palette.bright_green
  vim.g.terminal_color_11 = palette.bright_yellow
  vim.g.terminal_color_12 = palette.bright_blue
  vim.g.terminal_color_13 = palette.bright_magenta
  vim.g.terminal_color_14 = palette.bright_cyan
  vim.g.terminal_color_15 = palette.bright_white
end

return M