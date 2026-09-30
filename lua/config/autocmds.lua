-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Force Telescope transparency on every colorscheme load
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local telescope_groups = {
      "TelescopeNormal",
      "TelescopeBorder",
      "TelescopePromptNormal",
      "TelescopePromptBorder",
      "TelescopeResultsNormal",
      "TelescopeResultsBorder",
      "TelescopePreviewNormal",
      "TelescopePreviewBorder",
    }
    for _, group in ipairs(telescope_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
  end,
})

-- Strip the 'o' flag from 'formatoptions' so 'o'/'O' never continue comments.
-- Needed per-buffer because many runtime ftplugins re-add it with
-- `setlocal formatoptions+=croql` (sh, dosini, html, xml, typst, ...).
local strip_comment_continue = vim.api.nvim_create_augroup("strip_comment_continue", { clear = true })

local function remove_formatoptions_o()
  vim.opt_local.formatoptions:remove("o")
end

vim.api.nvim_create_autocmd("FileType", {
  group = strip_comment_continue,
  callback = remove_formatoptions_o,
})

-- Guard against re-entrancy: mutating 'formatoptions' here re-fires OptionSet.
local in_option_set = false
vim.api.nvim_create_autocmd("OptionSet", {
  group = strip_comment_continue,
  pattern = "formatoptions",
  callback = function()
    if in_option_set then
      return
    end
    in_option_set = true
    vim.opt_local.formatoptions:remove("o")
    in_option_set = false
  end,
})
