-- Transparent background for every colorscheme.
-- Also set up eagerly from `plugins/colorscheme.lua`, so the colorscheme that
-- is loaded at startup gets it as well.
require("config.highlights").setup()

-- GameMaker Language (existing)
vim.filetype.add({ extension = { gml = "gml" } })
-- ... rest of existing autocmds can remain, but better to keep original content
-- (preserving existing code below)
local function gml_hl()
  vim.api.nvim_set_hl(0, "@lsp.type.keyword", { link = "@keyword" })
  vim.api.nvim_set_hl(0, "@lsp.type.string", { link = "@string" })
  vim.api.nvim_set_hl(0, "@lsp.type.number", { link = "@number" })
  vim.api.nvim_set_hl(0, "@lsp.type.operator", { link = "@operator" })
  vim.api.nvim_set_hl(0, "@lsp.type.variable", { link = "@variable" })
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
  vim.bo.commentstring = "// %s"
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gml",
  callback = gml_hl,
})
