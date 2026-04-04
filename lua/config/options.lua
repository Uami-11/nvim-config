-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "lua",
--   callback = function()
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.tabstop = 4
--     vim.opt_local.softtabstop = 4
--   end,
-- })
local opt = vim.opt
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true -- Tells Vim to insert spaces instead of a Tab character.
