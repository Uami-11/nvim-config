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
    -- GameMaker-like colours for spec built-ins and object instance variables.
    -- Resolve from the active colorscheme's own palette so they harmonise with
    -- the theme (GMS's game is green built-ins, teal-ish fields, lavender
    -- variables). catppuccin already maps @lsp.typemod.function.defaultLibrary
    -- to @function.builtin, so spec functions need no link here.
    local function color(name, fallback)
      local cs = vim.g.colors_name or ""
      if cs:find("tokyonight", 1, true) then
        local ok, colors = pcall(require, "tokyonight.colors")
        if ok and colors.setup then
          local p = colors.setup()
          local key = name == "lavender" and "purple" or name
          if p and p[key] then
            return p[key]
          end
          if p and p[name] then
            return p[name]
          end
        end
      elseif cs:find("catppuccin", 1, true) then
        local ok, pal = pcall(require, "catppuccin.palettes")
        if ok and pal.get_palette then
          local p = pal.get_palette()
          if p and p[name] then
            return p[name]
          end
        end
      end
      return fallback
    end
    vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = color("green", "#a6e3a1") })
    vim.api.nvim_set_hl(0, "@lsp.typemod.property.defaultLibrary", { fg = color("teal", "#94e2d5") })
    vim.api.nvim_set_hl(0, "@lsp.type.instanceVariable", { fg = color("lavender", "#b4befe") })
    -- GML has no treesitter grammar, so the built-in gc/gcc comment operator
    -- falls back to 'commentstring'. Without it, gc on .gml files is a no-op.
    vim.bo.commentstring = "// %s"
  end,
})

-- Neovim stores all-caps globals in the shada file, which is used as a
-- fallback to remember the last colorscheme. Keep the flag enabled.
if not (vim.o.shada:match("^[^,]*") or ""):find("!", 1, true) then
  vim.opt.shada = (vim.o.shada:gsub("^([^,]*)", "%1!"))
end

local opt = vim.opt
opt.sidescrolloff = 0 -- Only scroll horizontally when the cursor actually leaves the window.
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true -- Tells Vim to insert spaces instead of a Tab character.
vim.o.winblend = 0
opt.formatoptions:remove("o") -- Don't auto-insert the comment leader after 'o'/'O'
