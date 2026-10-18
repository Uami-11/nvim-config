local M = {}

local transparent = true

local function none()
  return transparent and "NONE" or nil
end

function M.setup(palette)
  local hl = vim.api.nvim_set_hl
  local bg_none = none()

  -- Bufferline
  hl(0, "BufferLineBackground", { fg = palette.fg_dim, bg = bg_none or palette.bg_alt })
  hl(0, "BufferLineBufferSelected", { fg = palette.fg, bg = bg_none or palette.bg_tab_active, bold = true })
  hl(0, "BufferLineBufferVisible", { fg = palette.fg_alt, bg = bg_none or palette.bg_alt })
  hl(0, "BufferLineCloseButton", { fg = palette.fg_dim, bg = bg_none or palette.bg_alt })
  hl(0, "BufferLineCloseButtonSelected", { fg = palette.red, bg = bg_none or palette.bg_tab_active })
  hl(0, "BufferLineFill", { bg = bg_none or palette.bg_alt })
  hl(0, "BufferLineSeparator", { fg = palette.border, bg = bg_none or palette.bg_alt })
  hl(0, "BufferLineIndicatorSelected", { fg = palette.accent, bg = bg_none or palette.bg_tab_active })
  hl(0, "BufferLineTabSelected", { fg = palette.fg, bg = bg_none or palette.bg_tab_active, bold = true })
  hl(0, "BufferLineModified", { fg = palette.yellow, bg = bg_none or palette.bg_alt })
  hl(0, "BufferLineModifiedSelected", { fg = palette.yellow, bg = bg_none or palette.bg_tab_active })
  hl(0, "BufferLineError", { fg = palette.diag_error, bg = bg_none or palette.bg_alt })
  hl(0, "BufferLineWarning", { fg = palette.diag_warn, bg = bg_none or palette.bg_alt })
  hl(0, "BufferLineInfo", { fg = palette.diag_info, bg = bg_none or palette.bg_alt })
  hl(0, "BufferLineHint", { fg = palette.diag_hint, bg = bg_none or palette.bg_alt })

  -- Gitsigns
  hl(0, "GitSignsAdd", { fg = palette.git_add })
  hl(0, "GitSignsChange", { fg = palette.git_change })
  hl(0, "GitSignsDelete", { fg = palette.git_delete })
  hl(0, "GitSignsAddNr", { fg = palette.git_add })
  hl(0, "GitSignsChangeNr", { fg = palette.git_change })
  hl(0, "GitSignsDeleteNr", { fg = palette.git_delete })
  hl(0, "GitSignsAddLn", { bg = bg_none or palette.bg_lighter })
  hl(0, "GitSignsChangeLn", { bg = bg_none or palette.bg_lighter })
  hl(0, "GitSignsDeleteLn", { bg = bg_none })
  hl(0, "GitSignsCurrentLineBlame", { fg = palette.fg_dim, italic = true })

  -- Trouble
  hl(0, "TroubleText", { fg = palette.fg })
  hl(0, "TroubleCount", { fg = palette.accent, bold = true })
  hl(0, "TroubleFile", { fg = palette.call })
  hl(0, "TroubleFoldIcon", { fg = palette.fg_alt })
  hl(0, "TroubleLocation", { fg = palette.fg_dim })
  hl(0, "TroubleIndent", { fg = palette.fg_dim })
  hl(0, "TroubleSignError", { fg = palette.diag_error })
  hl(0, "TroubleSignWarning", { fg = palette.diag_warn })
  hl(0, "TroubleSignInformation", { fg = palette.diag_info })
  hl(0, "TroubleSignHint", { fg = palette.diag_hint })
  hl(0, "TroubleCode", { fg = palette.fg_alt })
  hl(0, "TroubleSource", { fg = palette.fg_dim })

  -- Which-key
  hl(0, "WhichKey", { fg = palette.accent })
  hl(0, "WhichKeyGroup", { fg = palette.call })
  hl(0, "WhichKeyDesc", { fg = palette.fg })
  hl(0, "WhichKeySeparator", { fg = palette.fg_dim })
  hl(0, "WhichKeyFloat", { bg = bg_none or palette.bg_float })
  hl(0, "WhichKeyBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })
  hl(0, "WhichKeyValue", { fg = palette.fg_alt })

  -- Noice
  hl(0, "NoiceCmdline", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "NoiceCmdlineIcon", { fg = palette.accent })
  hl(0, "NoiceCmdlinePopup", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "NoiceCmdlinePopupBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })
  hl(0, "NoiceConfirm", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "NoiceConfirmBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })
  hl(0, "NoicePopup", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "NoicePopupBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })
  hl(0, "NoiceMini", { fg = palette.fg, bg = bg_none or palette.bg_popup })
  hl(0, "NoiceLspProgressTitle", { fg = palette.accent })
  hl(0, "NoiceLspProgressClient", { fg = palette.call })
  hl(0, "NoiceLspProgressSpinner", { fg = palette.yellow })
  hl(0, "NoiceHover", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "NoiceHoverBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })

  -- Snacks
  hl(0, "SnacksPickerList", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "SnacksPickerBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })
  hl(0, "SnacksPickerInput", { fg = palette.fg, bg = bg_none or palette.bg_input })
  hl(0, "SnacksPickerInputBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_input })
  hl(0, "SnacksPickerTitle", { fg = palette.fg_accent, bg = bg_none or palette.bg_float })
  hl(0, "SnacksPickerPreview", { bg = bg_none or palette.bg_alt })
  hl(0, "SnacksInput", { fg = palette.fg, bg = bg_none or palette.bg_input })
  hl(0, "SnacksInputBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_input })
  hl(0, "SnacksNotifierInfo", { fg = palette.diag_info, bg = bg_none or palette.bg_popup })
  hl(0, "SnacksNotifierWarn", { fg = palette.diag_warn, bg = bg_none or palette.bg_popup })
  hl(0, "SnacksNotifierError", { fg = palette.diag_error, bg = bg_none or palette.bg_popup })
  hl(0, "SnacksNotifierHint", { fg = palette.diag_hint, bg = bg_none or palette.bg_popup })
  hl(0, "SnacksDashboardHeader", { fg = palette.accent })
  hl(0, "SnacksDashboardFooter", { fg = palette.fg_dim })
  hl(0, "SnacksDashboardCenter", { fg = palette.fg })
  hl(0, "SnacksIndent", { fg = palette.fg_dim })
  hl(0, "SnacksScope", { fg = palette.yellow })

  -- Blink.cmp
  hl(0, "BlinkCmpMenu", { fg = palette.fg, bg = bg_none or palette.bg_popup })
  hl(0, "BlinkCmpMenuBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_popup })
  hl(0, "BlinkCmpMenuSelection", { fg = palette.fg, bg = bg_none or palette.bg_selection, bold = true })
  hl(0, "BlinkCmpLabel", { fg = palette.fg })
  hl(0, "BlinkCmpLabelMatch", { fg = palette.accent, bold = true })
  hl(0, "BlinkCmpLabelDetail", { fg = palette.fg_dim })
  hl(0, "BlinkCmpLabelDescription", { fg = palette.fg_dim })
  hl(0, "BlinkCmpGhostText", { fg = palette.fg_dim, italic = true })
  hl(0, "BlinkCmpScrollBarThumb", { bg = bg_none or palette.border_focus })
  hl(0, "BlinkCmpScrollBarTrack", { bg = bg_none or palette.bg_lighter })
  hl(0, "BlinkCmpSignatureHelp", { fg = palette.fg, bg = bg_none or palette.bg_popup })
  hl(0, "BlinkCmpSignatureHelpBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_popup })
  hl(0, "BlinkCmpDoc", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "BlinkCmpDocBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })

  local kinds = {
    Text = palette.fg,
    Method = palette.call,
    Function = palette.call,
    Constructor = palette.func,
    Field = palette.field,
    Variable = palette.fg,
    Class = palette.func,
    Interface = palette.interface,
    Module = palette.namespace,
    Property = palette.field,
    Unit = palette.number,
    Value = palette.string,
    Enum = palette.enum,
    Keyword = palette.keyword,
    Snippet = palette.macro,
    Color = palette.string,
    File = palette.call,
    Reference = palette.call,
    Folder = palette.call,
    EnumMember = palette.enum_member,
    Constant = palette.constant,
    Struct = palette.func,
    Event = palette.yellow,
    Operator = palette.keyword,
    TypeParameter = palette.type_param,
  }
  for k, v in pairs(kinds) do
    hl(0, "BlinkCmpKind" .. k, { fg = v })
  end

  -- Flash
  hl(0, "FlashMatch", { fg = palette.bg, bg = palette.yellow })
  hl(0, "FlashCurrent", { fg = palette.bg, bg = palette.accent })
  hl(0, "FlashBackdrop", { fg = palette.fg_dim })
  hl(0, "FlashLabel", { fg = palette.bg, bg = palette.green, bold = true })

  -- Grug-far
  hl(0, "GrugFarInput", { fg = palette.fg, bg = bg_none or palette.bg_input })
  hl(0, "GrugFarInputBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_input })
  hl(0, "GrugFarOutput", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "GrugFarOutputBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })
  hl(0, "GrugFarMatch", { fg = palette.bg, bg = palette.yellow })
  hl(0, "GrugFarReplace", { fg = palette.bg, bg = palette.red })

  -- Todo-comments
  hl(0, "TodoBgTODO", { fg = palette.bg, bg = palette.cyan, bold = true })
  hl(0, "TodoFgTODO", { fg = palette.cyan })
  hl(0, "TodoBgFIX", { fg = palette.bg, bg = palette.red, bold = true })
  hl(0, "TodoFgFIX", { fg = palette.red })
  hl(0, "TodoBgHACK", { fg = palette.bg, bg = palette.yellow, bold = true })
  hl(0, "TodoFgHACK", { fg = palette.yellow })
  hl(0, "TodoBgWARN", { fg = palette.bg, bg = palette.yellow, bold = true })
  hl(0, "TodoFgWARN", { fg = palette.yellow })
  hl(0, "TodoBgNOTE", { fg = palette.bg, bg = palette.green, bold = true })
  hl(0, "TodoFgNOTE", { fg = palette.green })
  hl(0, "TodoBgPERF", { fg = palette.bg, bg = palette.magenta, bold = true })
  hl(0, "TodoFgPERF", { fg = palette.magenta })
  hl(0, "TodoBgTEST", { fg = palette.bg, bg = palette.accent, bold = true })
  hl(0, "TodoFgTEST", { fg = palette.accent })

  -- Dressing
  hl(0, "DressingInput", { fg = palette.fg, bg = bg_none or palette.bg_input })
  hl(0, "DressingInputBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_input })
  hl(0, "DressingSelect", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "DressingSelectBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })

  -- DAP UI
  hl(0, "DapUINormal", { fg = palette.fg, bg = bg_none or palette.bg_float })
  hl(0, "DapUIFloatBorder", { fg = palette.border_focus, bg = bg_none or palette.bg_float })
  hl(0, "DapUIPlayPause", { fg = palette.green })
  hl(0, "DapUIStop", { fg = palette.red })
  hl(0, "DapUIRestart", { fg = palette.yellow })
  hl(0, "DapUIStepOver", { fg = palette.accent })
  hl(0, "DapUIStepInto", { fg = palette.accent })
  hl(0, "DapUIStepOut", { fg = palette.accent })
  hl(0, "DapUIStepBack", { fg = palette.accent })
  hl(0, "DapUIThread", { fg = palette.call })
  hl(0, "DapUIStoppedThread", { fg = palette.accent })
  hl(0, "DapUIScopes", { fg = palette.fg })
  hl(0, "DapUIWatched", { fg = palette.yellow })
  hl(0, "DapUIDecoration", { fg = palette.fg_dim })
  hl(0, "DapUILineNumber", { fg = palette.fg_dim })
  hl(0, "DapUIWinSelect", { fg = palette.accent, bold = true })
  hl(0, "DapUIBreakpointsPath", { fg = palette.call })
  hl(0, "DapUIBreakpointsInfo", { fg = palette.green })
  hl(0, "DapUIBreakpointsCurrentLine", { fg = palette.yellow, bold = true })
  hl(0, "DapUIBreakpointsLine", { fg = palette.fg_dim })

  -- DAP virtual text
  hl(0, "DapVirtualText", { fg = palette.fg_dim, italic = true })
  hl(0, "DapVirtualTextError", { fg = palette.diag_error, italic = true })
  hl(0, "DapVirtualTextWarn", { fg = palette.diag_warn, italic = true })
  hl(0, "DapVirtualTextInfo", { fg = palette.diag_info, italic = true })
end

return M