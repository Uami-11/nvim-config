---@brief Highlight tweaks that have to be re-applied on every colorscheme change.
---
--- The autocmds in `config/autocmds.lua` are loaded lazily by LazyVim (only on
--- `User VeryLazy` when nvim is started without a file), so the setup below is
--- also called eagerly from `plugins/colorscheme.lua`. That way the colorscheme
--- loaded at startup already gets the transparent background.

local M = {}

local transparent_groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "SignColumn",
  "FoldColumn",
  "WinSeparator",
  "VertSplit",
  "FloatBorder",
  "StatusLine",
  "StatusLineNC",
  "TabLine",
  "TabLineFill",
  "Pmenu",
  "PmenuSbar",
  "PmenuThumb",
  "CursorLine",
  "CursorColumn",
}

---Make the background of the UI transparent.
function M.transparent_bg()
  for _, group in ipairs(transparent_groups) do
    -- `update = true` keeps the colors of the colorscheme and only clears the
    -- background, `nvim_set_hl` replaces the whole group otherwise.
    vim.api.nvim_set_hl(0, group, { bg = "NONE", update = true })
  end
end

local registered = false

---Re-apply the highlights whenever the colorscheme changes.
--- Safe to call more than once, the autocmd is only created once.
function M.setup()
  if registered then
    return
  end
  registered = true
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = M.transparent_bg,
  })
end

return M
