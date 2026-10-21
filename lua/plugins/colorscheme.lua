---@brief Colorscheme management.
---
--- The last used colorscheme is remembered and restored on the next start, so
--- `:colorscheme` is no longer overridden by a hardcoded default.
--- `rusty-colors` is only used as the fallback for the very first start (or
--- when the remembered colorscheme cannot be loaded).
---
--- The colorscheme is stored in two places:
---   * `stdpath("state")/lazyvim-colorscheme`, written on every change.
---   * the global `g:COLORSCHEME`, which Neovim stores in the shada file.
---     The shada file is read *after* the config has been loaded, so it is
---     only used as a fallback on `VimEnter`.

local state_file = vim.fn.stdpath("state") .. "/lazyvim-colorscheme"

-- The shada file is only read after the config has been loaded, so the global
-- that holds the colorscheme may only be written once that happened.
local shada_ready = false

---Save the current colorscheme so it can be restored later.
---@param name string?
local function save(name)
  if not name or name == "" then
    return
  end
  if shada_ready then
    -- shada only stores globals that are written in all caps
    vim.g.COLORSCHEME = name
  end
  vim.fn.mkdir(vim.fn.fnamemodify(state_file, ":h"), "p")
  pcall(vim.fn.writefile, { name }, state_file)
end

---The colorscheme that was used last, as stored in the state file.
---@return string?
local function last_used()
  local ok, lines = pcall(vim.fn.readfile, state_file)
  if ok and lines and lines[1] and lines[1] ~= "" then
    return lines[1]
  end
end

---Find the plugin that ships the colorscheme.
---@param name string
---@return table?
local function find_plugin(name)
  local ok, config = pcall(require, "lazy.core.config")
  if not ok then
    return nil
  end
  -- an exact name match comes first
  for _, plugin in pairs(config.plugins) do
    if plugin.name == name and plugin.dir then
      return plugin
    end
  end
  -- then any plugin that has a colors file with that name
  for _, plugin in pairs(config.plugins) do
    if plugin.dir then
      local found = vim.fn.glob(plugin.dir .. "/colors/" .. name .. ".*", true, true)
      if #found > 0 then
        return plugin
      end
    end
  end
  return nil
end

---Load a colorscheme, loading the plugin that ships it when needed.
---@param name string
---@return boolean success
local function load_theme(name)
  -- The plugin has to be loaded first: a colorscheme can be shipped by a
  -- lazy-loaded plugin and would otherwise be shadowed by a bundled one
  -- (Neovim ships `runtime/colors/catppuccin.vim` for example).
  local plugin = find_plugin(name)
  if plugin and not plugin._.loaded then
    require("lazy").load({ plugins = { plugin.name } })
  end
  return pcall(vim.cmd.colorscheme, name)
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- Called by LazyVim on every startup, after the plugins have been set up.
      colorscheme = function()
        -- Apply the highlights eagerly, the autocmds are loaded lazily.
        require("config.highlights").setup()

        -- Load the plugin that ships a colorscheme before it is applied, so a
        -- bundled colorscheme does not shadow it.
        vim.api.nvim_create_autocmd("ColorSchemePre", {
          pattern = "*",
          callback = function(ev)
            local plugin = find_plugin(ev.match)
            if plugin and not plugin._.loaded then
              require("lazy").load({ plugins = { plugin.name } })
            end
          end,
        })

        -- Remember every colorscheme change from now on.
        vim.api.nvim_create_autocmd("ColorScheme", {
          pattern = "*",
          callback = function()
            save(vim.g.colors_name)
          end,
        })

        local saved = last_used()
        local restored = saved and load_theme(saved) or false
        if not restored then
          load_theme("rusty-colors")
        end
        local startup_theme = vim.g.colors_name

        -- The shada file is read after the config has been loaded, so the
        -- colorscheme it remembers is only available here.
        vim.api.nvim_create_autocmd("VimEnter", {
          once = true,
          -- `nested` is needed, otherwise the events of the colorscheme that
          -- is applied below are not fired.
          nested = true,
          callback = function()
            -- the shada has been read by now, so the global may be written
            shada_ready = true
            local from_shada = vim.g.COLORSCHEME
            local unchanged = vim.g.colors_name == startup_theme
            if not restored and unchanged and type(from_shada) == "string" and from_shada ~= "" and from_shada ~= vim.g.colors_name then
              -- no state file, fall back to the colorscheme from the shada
              load_theme(from_shada)
            else
              -- keep the shada in sync with the colorscheme that is active
              vim.g.COLORSCHEME = vim.g.colors_name
            end
          end,
        })
      end,
    },
  },
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
