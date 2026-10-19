local opt = vim.opt
opt.sidescrolloff = 0 -- Only scroll horizontally when the cursor actually leaves the window.
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true -- Tells Vim to insert spaces instead of a Tab character.
vim.o.winblend = 0
opt.formatoptions:remove("o") -- Don't auto-insert the comment leader after 'o'/'O'
