local function transparent_bg()
  local hl = vim.api.nvim_set_hl
  hl(0, "Normal", { bg = "NONE" })
  hl(0, "NormalNC", { bg = "NONE" })
  hl(0, "NormalFloat", { bg = "NONE" })
  hl(0, "SignColumn", { bg = "NONE" })
  hl(0, "FoldColumn", { bg = "NONE" })
  hl(0, "WinSeparator", { bg = "NONE" })
  hl(0, "VertSplit", { bg = "NONE" })
  hl(0, "FloatBorder", { bg = "NONE" })
  hl(0, "StatusLine", { bg = "NONE" })
  hl(0, "StatusLineNC", { bg = "NONE" })
  hl(0, "TabLine", { bg = "NONE" })
  hl(0, "TabLineFill", { bg = "NONE" })
  hl(0, "Pmenu", { bg = "NONE" })
  hl(0, "PmenuSbar", { bg = "NONE" })
  hl(0, "PmenuThumb", { bg = "NONE" })
  hl(0, "CursorLine", { bg = "NONE" })
  hl(0, "CursorColumn", { bg = "NONE" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = transparent_bg,
})
