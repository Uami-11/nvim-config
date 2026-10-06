-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "lua",
--   callback = function()
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.tabstop = 4
--     vim.opt_local.softtabstop = 4
--   end,
-- })
-- GameMaker Language
vim.filetype.add({ extension = { gml = "gml" } })
-- gmlls semantic tokens: Neovim links most @lsp.type.* groups to treesitter
-- colours by default, but not keyword/string/number/operator, and catppuccin
-- blanks @lsp.type.variable (fine when treesitter detects variables itself,
-- which GML has no grammar for). Re-apply GML-friendly links whenever a .gml
-- buffer opens so they survive the colorscheme's own highlight pass.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gml",
  callback = function()
    vim.api.nvim_set_hl(0, "@lsp.type.keyword", { link = "@keyword" })
    vim.api.nvim_set_hl(0, "@lsp.type.string", { link = "@string" })
    vim.api.nvim_set_hl(0, "@lsp.type.number", { link = "@number" })
    vim.api.nvim_set_hl(0, "@lsp.type.operator", { link = "@operator" })
    vim.api.nvim_set_hl(0, "@lsp.type.variable", { link = "@variable" })
  end,
})

local opt = vim.opt
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true -- Tells Vim to insert spaces instead of a Tab character.
vim.o.winblend = 0
opt.formatoptions:remove("o") -- Don't auto-insert the comment leader after 'o'/'O'
