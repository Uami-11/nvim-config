-- GameMaker Studio 2 (classic dark) colorscheme for Neovim.
--
-- Palette is taken from GameMaker's own standard dark code editor scheme
-- (the values GMEdit's "gms2"/"dark" themes and YellowAfterlife's GML
-- syntax highlighter reproduce):
--
--   background      #222222   gutter / status bar   #2B343B
--   foreground      #C0C0C0   floats / completion   #1F1F1F
--   keywords/functions/braces  #FFB871 (orange)
--   numbers/constants/builtin assets #FF8080 (salmon)
--   strings         #FCF320 (yellow)   comments   #5B995B (green)
--   user variables  #B2B1FF (lavender)  locals    #FFF899 (pale yellow)
--   fields          #CC9FFF (violet)    preproc   #AA77BB (purple)
--   built-ins       #58E55A (green)     GM accent  #0B9B80 (teal)
--
-- Backgrounds are intentionally left unset (transparent) for the editor,
-- floats, pickers and the completion menu, matching the rest of this config.
local M = {}

M.palette = {
  bg = "#222222",
  bg_alt = "#2B343B", -- gutter, status bar, cursorline
  bg_float = "#1F1F1F", -- completion menu
  bg_highlight = "#333333",
  selection = "#636E75", -- GMS light-blue selection over #222222
  search = "#4E5A66",
  fg = "#C0C0C0",
  fg_bright = "#EEEEEE",
  fg_dim = "#8A8A8A",
  fg_dark = "#696969",
  comment = "#5B995B",
  orange = "#FFB871",
  salmon = "#FF8080",
  yellow = "#FCF320",
  green = "#58E55A",
  teal = "#0B9B80",
  lavender = "#B2B1FF",
  field = "#CC9FFF",
  local_var = "#FFF899",
  magenta = "#FF7EFF",
  purple = "#AA77BB",
  blue = "#40C3F4",
  red = "#FF5555",
}

---Completion-kind colours, shared by blink.cmp and nvim-cmp.
---@param p table
---@return table<string, string>
local function kind_colors(p)
  return {
    Text = p.fg,
    Method = p.orange,
    Function = p.orange,
    Constructor = p.orange,
    Class = p.orange,
    Interface = p.orange,
    TypeParameter = p.orange,
    Keyword = p.orange,
    Field = p.teal,
    Property = p.teal,
    Variable = p.lavender,
    Module = p.salmon,
    Unit = p.salmon,
    Value = p.salmon,
    Enum = p.salmon,
    EnumMember = p.salmon,
    Constant = p.salmon,
    Struct = p.salmon,
    Reference = p.salmon,
    Color = p.salmon,
    Snippet = p.yellow,
    File = p.blue,
    Folder = p.blue,
    Event = p.purple,
    Operator = p.fg,
  }
end

---@param p table
local function apply(p)
  local set = vim.api.nvim_set_hl

  local function hi(group, spec)
    set(0, group, spec)
  end

  local function link(group, target)
    set(0, group, { link = target })
  end

  ----------------------------------------------------------------------------
  -- Editor UI
  ----------------------------------------------------------------------------
  hi("Normal", { fg = p.fg })
  link("NormalNC", "Normal")
  hi("NormalFloat", { fg = p.fg })
  hi("FloatBorder", { fg = p.fg_dark })
  hi("FloatTitle", { fg = p.teal, bold = true })
  hi("Title", { fg = p.teal, bold = true })
  hi("Cursor", { fg = p.bg, bg = p.fg })
  link("lCursor", "Cursor")
  link("CursorIM", "Cursor")
  link("TermCursor", "Cursor")
  hi("TermCursorNC", { fg = p.bg, bg = p.fg_dark })
  hi("CursorLine", { bg = p.bg_alt })
  hi("CursorColumn", { bg = p.bg_alt })
  hi("CursorLineNr", { fg = p.blue, bold = true })
  hi("ColorColumn", { bg = p.bg_alt })
  hi("Conceal", { fg = p.fg_dark })
  hi("CurSearch", { fg = p.bg, bg = p.orange, bold = true })
  hi("Search", { fg = p.fg_bright, bg = p.search })
  hi("IncSearch", { fg = p.bg, bg = p.orange })
  hi("Substitute", { fg = p.bg, bg = p.salmon })
  hi("LineNr", { fg = p.blue })
  hi("SignColumn", { fg = p.fg_dark })
  hi("FoldColumn", { fg = p.fg_dark })
  hi("Folded", { fg = p.fg_dim, bg = p.bg_alt })
  hi("StatusLine", { fg = p.fg_bright, bg = p.bg_alt, bold = true })
  hi("StatusLineNC", { fg = p.fg_dark, bg = p.bg })
  link("StatusLineTerm", "StatusLine")
  link("StatusLineTermNC", "StatusLineNC")
  hi("WinBar", { fg = p.fg_bright, bg = p.bg })
  hi("WinBarNC", { fg = p.fg_dark, bg = p.bg })
  hi("WinSeparator", { fg = p.bg_highlight })
  link("VertSplit", "WinSeparator")
  hi("TabLine", { fg = p.fg_dim, bg = p.bg })
  hi("TabLineFill", { fg = p.fg_dark, bg = p.bg })
  hi("TabLineSel", { fg = p.fg_bright, bg = p.bg_alt, bold = true })
  hi("Pmenu", { fg = p.fg, bg = p.bg_float })
  hi("PmenuSel", { fg = p.bg, bg = p.teal, bold = true })
  hi("PmenuSbar", { bg = p.bg_alt })
  hi("PmenuThumb", { bg = p.fg_dark })
  hi("PmenuExtra", { fg = p.fg_dim })
  link("PmenuExtraSel", "PmenuSel")
  hi("PmenuKind", { fg = p.orange })
  link("PmenuKindSel", "PmenuSel")
  hi("WildMenu", { fg = p.bg, bg = p.orange, bold = true })
  hi("Visual", { bg = p.selection })
  hi("VisualNC", { bg = p.bg_alt })
  hi("NonText", { fg = p.bg_highlight })
  hi("SpecialKey", { fg = p.bg_highlight })
  hi("Whitespace", { fg = p.bg_highlight })
  hi("EndOfBuffer", { fg = p.bg_highlight })
  hi("MatchParen", { fg = p.orange, bg = p.bg_highlight, bold = true })
  hi("Question", { fg = p.blue })
  hi("MoreMsg", { fg = p.green })
  hi("ModeMsg", { fg = p.fg_bright })
  hi("MsgArea", { fg = p.fg })
  hi("MsgSeparator", { fg = p.bg_highlight })
  hi("QuickFixLine", { bg = p.bg_alt, bold = true })
  hi("qfFileName", { fg = p.blue })
  hi("qfLineNr", { fg = p.fg_dark })
  hi("Directory", { fg = p.blue })
  hi("ErrorMsg", { fg = p.red, bold = true })
  hi("WarningMsg", { fg = p.orange })
  hi("SpellBad", { sp = p.red, undercurl = true })
  hi("SpellCap", { sp = p.blue, undercurl = true })
  hi("SpellLocal", { sp = p.teal, undercurl = true })
  hi("SpellRare", { sp = p.lavender, undercurl = true })

  ----------------------------------------------------------------------------
  -- Vim syntax groups
  ----------------------------------------------------------------------------
  hi("Comment", { fg = p.comment })
  hi("Constant", { fg = p.salmon })
  hi("String", { fg = p.yellow })
  link("Character", "String")
  hi("Number", { fg = p.salmon })
  hi("Boolean", { fg = p.salmon })
  link("Float", "Number")
  hi("Identifier", { fg = p.lavender })
  hi("Function", { fg = p.orange })
  hi("Statement", { fg = p.orange })
  link("Conditional", "Statement")
  link("Repeat", "Statement")
  link("Label", "Statement")
  link("Keyword", "Statement")
  link("Exception", "Statement")
  hi("Operator", { fg = p.fg })
  hi("PreProc", { fg = p.purple })
  link("Include", "PreProc")
  link("Define", "PreProc")
  link("Macro", "PreProc")
  link("PreCondit", "PreProc")
  hi("Type", { fg = p.orange })
  link("StorageClass", "Type")
  link("Structure", "Type")
  link("Typedef", "Type")
  hi("Special", { fg = p.salmon })
  link("SpecialChar", "String")
  hi("Tag", { fg = p.orange })
  hi("Delimiter", { fg = p.fg })
  hi("SpecialComment", { fg = p.comment, bold = true })
  hi("Debug", { fg = p.salmon })
  hi("Underlined", { underline = true })
  hi("Ignore", { fg = p.fg_dark })
  hi("Error", { fg = p.red })
  hi("Todo", { fg = p.yellow, bold = true })

  ----------------------------------------------------------------------------
  -- Diagnostics / LSP
  ----------------------------------------------------------------------------
  hi("DiagnosticError", { fg = p.red })
  hi("DiagnosticWarn", { fg = p.orange })
  hi("DiagnosticInfo", { fg = p.blue })
  hi("DiagnosticHint", { fg = p.teal })
  hi("DiagnosticOk", { fg = p.green })
  hi("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
  hi("DiagnosticUnderlineWarn", { sp = p.orange, undercurl = true })
  hi("DiagnosticUnderlineInfo", { sp = p.blue, undercurl = true })
  hi("DiagnosticUnderlineHint", { sp = p.teal, undercurl = true })
  hi("DiagnosticUnderlineOk", { sp = p.green, undercurl = true })
  hi("DiagnosticVirtualTextError", { fg = p.red })
  hi("DiagnosticVirtualTextWarn", { fg = p.orange })
  hi("DiagnosticVirtualTextInfo", { fg = p.blue })
  hi("DiagnosticVirtualTextHint", { fg = p.teal })
  hi("DiagnosticVirtualTextOk", { fg = p.green })
  link("DiagnosticFloatingError", "DiagnosticError")
  link("DiagnosticFloatingWarn", "DiagnosticWarn")
  link("DiagnosticFloatingInfo", "DiagnosticInfo")
  link("DiagnosticFloatingHint", "DiagnosticHint")
  link("DiagnosticFloatingOk", "DiagnosticOk")
  link("DiagnosticSignError", "DiagnosticError")
  link("DiagnosticSignWarn", "DiagnosticWarn")
  link("DiagnosticSignInfo", "DiagnosticInfo")
  link("DiagnosticSignHint", "DiagnosticHint")
  link("DiagnosticSignOk", "DiagnosticOk")
  link("ErrorFloat", "DiagnosticError")
  link("WarnFloat", "DiagnosticWarn")
  link("InfoFloat", "DiagnosticInfo")
  link("HintFloat", "DiagnosticHint")
  link("OkFloat", "DiagnosticOk")
  hi("LspReferenceText", { bg = p.bg_highlight })
  hi("LspReferenceRead", { bg = p.bg_highlight })
  hi("LspReferenceWrite", { bg = p.bg_highlight, bold = true })
  hi("LspCodeLens", { fg = p.fg_dark })
  hi("LspCodeLensSeparator", { fg = p.fg_dark })
  hi("LspInlayHint", { fg = p.fg_dark, italic = true })
  link("LspInfoBorder", "FloatBorder")

  ----------------------------------------------------------------------------
  -- Diffs
  ----------------------------------------------------------------------------
  hi("DiffAdd", { bg = "#2A3A2A" })
  hi("DiffChange", { bg = "#3A382A" })
  hi("DiffDelete", { bg = "#3F2A2A" })
  hi("DiffText", { bg = "#565038" })
  hi("diffAdded", { fg = p.green })
  hi("diffRemoved", { fg = p.red })
  hi("diffChanged", { fg = p.orange })
  hi("diffFile", { fg = p.blue })
  hi("diffLine", { fg = p.teal })

  ----------------------------------------------------------------------------
  -- Treesitter
  ----------------------------------------------------------------------------
  link("@comment", "Comment")
  link("@comment.documentation", "Comment")
  link("@string", "String")
  link("@string.escape", "String")
  link("@string.regexp", "String")
  link("@string.special", "String")
  link("@character", "Character")
  link("@character.special", "SpecialChar")
  link("@number", "Number")
  link("@number.float", "Float")
  link("@boolean", "Boolean")
  link("@constant", "Constant")
  link("@constant.builtin", "Constant")
  link("@constant.macro", "Macro")
  link("@function", "Function")
  hi("@function.builtin", { fg = p.green })
  link("@function.call", "Function")
  link("@function.method", "Function")
  link("@function.method.call", "Function")
  link("@function.macro", "Macro")
  link("@constructor", "Function")
  hi("@variable", { fg = p.lavender })
  hi("@variable.local", { fg = p.local_var })
  hi("@variable.builtin", { fg = p.green })
  hi("@variable.parameter", { fg = p.local_var })
  hi("@variable.member", { fg = p.field })
  hi("@property", { fg = p.field })
  hi("@field", { fg = p.field })
  hi("@type", { fg = p.orange })
  hi("@type.builtin", { fg = p.orange })
  hi("@type.definition", { fg = p.orange })
  link("@type.qualifier", "Statement")
  link("@attribute", "PreProc")
  link("@attribute.builtin", "PreProc")
  link("@keyword", "Statement")
  link("@keyword.function", "Statement")
  link("@keyword.return", "Statement")
  link("@keyword.operator", "Statement")
  link("@keyword.conditional", "Statement")
  link("@keyword.repeat", "Statement")
  link("@keyword.exception", "Statement")
  link("@keyword.import", "Statement")
  link("@keyword.export", "Statement")
  link("@keyword.coroutine", "Statement")
  link("@keyword.modifier", "Statement")
  link("@keyword.storage", "Statement")
  link("@keyword.directive", "PreProc")
  link("@keyword.directive.define", "PreProc")
  link("@preproc", "PreProc")
  link("@define", "PreProc")
  link("@macro", "Macro")
  link("@operator", "Operator")
  hi("@punctuation.bracket", { fg = p.fg })
  hi("@punctuation.delimiter", { fg = p.fg })
  hi("@punctuation.special", { fg = p.orange })
  hi("@label", { fg = p.salmon })
  hi("@module", { fg = p.fg })
  hi("@module.builtin", { fg = p.green })
  link("@include", "Include")
  link("@exception", "Exception")
  link("@debug", "Debug")
  hi("@symbol", { fg = p.salmon })
  hi("@tag", { fg = p.orange })
  hi("@tag.attribute", { fg = p.field })
  hi("@tag.delimiter", { fg = p.fg })
  hi("@diff.plus", { fg = p.green })
  hi("@diff.minus", { fg = p.red })
  hi("@diff.delta", { fg = p.orange })

  -- markup (markdown, help, ...)
  hi("@markup.heading", { fg = p.teal, bold = true })
  for i = 1, 6 do
    hi("@markup.heading." .. i, { fg = p.teal, bold = true })
  end
  hi("@markup.strong", { bold = true })
  hi("@markup.italic", { italic = true })
  hi("@markup.strikethrough", { strikethrough = true })
  hi("@markup.underline", { underline = true })
  hi("@markup.quote", { fg = p.comment })
  hi("@markup.math", { fg = p.blue })
  hi("@markup.link", { fg = p.blue, underline = true })
  hi("@markup.link.label", { fg = p.blue })
  hi("@markup.link.url", { fg = p.blue, underline = true })
  hi("@markup.raw", { fg = p.yellow })
  hi("@markup.raw.block", { fg = p.yellow })
  hi("@markup.list", { fg = p.salmon })
  hi("@markup.list.checked", { fg = p.green })
  hi("@markup.list.unchecked", { fg = p.fg_dark })

  ----------------------------------------------------------------------------
  -- LSP semantic tokens
  ----------------------------------------------------------------------------
  link("@lsp.type.comment", "Comment")
  link("@lsp.type.keyword", "@keyword")
  link("@lsp.type.string", "@string")
  link("@lsp.type.number", "@number")
  link("@lsp.type.operator", "@operator")
  link("@lsp.type.variable", "@variable")
  link("@lsp.type.function", "@function")
  link("@lsp.type.method", "@function.method")
  link("@lsp.type.parameter", "@variable.parameter")
  link("@lsp.type.property", "@property")
  link("@lsp.type.namespace", "@module")
  link("@lsp.type.type", "@type")
  link("@lsp.type.class", "@type")
  link("@lsp.type.struct", "@type")
  link("@lsp.type.enum", "@type")
  link("@lsp.type.interface", "@type")
  link("@lsp.type.typeParameter", "@type")
  link("@lsp.type.decorator", "@attribute")
  link("@lsp.type.macro", "@macro")
  link("@lsp.type.enumMember", "@constant")
  hi("@lsp.type.instanceVariable", { fg = p.lavender })
  -- Built-ins stay green, built-in library properties teal (GMS look).
  hi("@lsp.typemod.function.defaultLibrary", { fg = p.green })
  hi("@lsp.typemod.variable.defaultLibrary", { fg = p.green })
  hi("@lsp.typemod.property.defaultLibrary", { fg = p.teal })
  hi("@lsp.mod.deprecated", { strikethrough = true })

  ----------------------------------------------------------------------------
  -- Git
  ----------------------------------------------------------------------------
  hi("GitSignsAdd", { fg = p.green })
  hi("GitSignsChange", { fg = p.orange })
  hi("GitSignsDelete", { fg = p.red })
  hi("GitSignsAddNr", { fg = p.green })
  hi("GitSignsChangeNr", { fg = p.orange })
  hi("GitSignsDeleteNr", { fg = p.red })
  hi("GitSignsAddInline", { bg = "#2A3A2A" })
  hi("GitSignsChangeInline", { bg = "#3A382A" })
  hi("GitSignsDeleteInline", { bg = "#3F2A2A" })
  hi("GitSignsChangedelete", { fg = p.orange })
  hi("GitSignsTopdelete", { fg = p.red })
  hi("GitSignsUntracked", { fg = p.teal })
  hi("GitSignsCurrentLineBlame", { fg = p.fg_dark, italic = true })
  link("GitSignsAddPreview", "DiffAdd")
  link("GitSignsDeletePreview", "DiffDelete")

  ----------------------------------------------------------------------------
  -- Pickers (snacks.nvim / telescope)
  ----------------------------------------------------------------------------
  hi("SnacksPickerMatch", { fg = p.orange, bold = true })
  hi("SnacksPickerDir", { fg = p.fg_dark })
  hi("SnacksPickerInputSearch", { fg = p.orange })
  hi("SnacksInputNormal", { fg = p.fg })
  hi("SnacksInputBorder", { fg = p.fg_dark })
  hi("SnacksInputTitle", { fg = p.teal })
  hi("SnacksIndent", { fg = p.bg_highlight })
  hi("SnacksIndentScope", { fg = p.teal })
  hi("SnacksDashboardHeader", { fg = p.teal })
  hi("SnacksDashboardFooter", { fg = p.fg_dark })
  hi("SnacksDashboardDesc", { fg = p.fg })
  hi("SnacksDashboardIcon", { fg = p.blue })
  hi("SnacksDashboardKey", { fg = p.orange, bold = true })
  hi("SnacksDashboardTitle", { fg = p.teal, bold = true })
  hi("SnacksDashboardSpecial", { fg = p.fg_dark })
  hi("SnacksNotifierError", { fg = p.red })
  hi("SnacksNotifierWarn", { fg = p.orange })
  hi("SnacksNotifierInfo", { fg = p.blue })
  hi("SnacksNotifierDebug", { fg = p.fg_dim })
  hi("SnacksNotifierTrace", { fg = p.teal })
  hi("SnacksTerminal", { fg = p.fg })

  hi("TelescopeNormal", { fg = p.fg })
  hi("TelescopeBorder", { fg = p.fg_dark })
  hi("TelescopePromptNormal", { fg = p.fg })
  hi("TelescopePromptBorder", { fg = p.fg_dark })
  hi("TelescopePromptPrefix", { fg = p.teal })
  hi("TelescopePromptTitle", { fg = p.bg, bg = p.teal, bold = true })
  hi("TelescopeResultsTitle", { fg = p.teal })
  hi("TelescopePreviewTitle", { fg = p.teal })
  hi("TelescopeSelection", { bg = p.selection })
  hi("TelescopeMatching", { fg = p.orange, bold = true })

  ----------------------------------------------------------------------------
  -- Completion (blink.cmp / nvim-cmp)
  ----------------------------------------------------------------------------
  hi("BlinkCmpMenu", { fg = p.fg })
  hi("BlinkCmpMenuBorder", { fg = p.fg_dark })
  hi("BlinkCmpMenuSelection", { fg = p.bg, bg = p.teal, bold = true })
  hi("BlinkCmpDoc", { fg = p.fg })
  hi("BlinkCmpDocBorder", { fg = p.fg_dark })
  hi("BlinkCmpDocSeparator", { fg = p.fg_dark })
  hi("BlinkCmpSignatureHelp", { fg = p.fg })
  hi("BlinkCmpSignatureHelpBorder", { fg = p.fg_dark })
  hi("BlinkCmpLabel", { fg = p.fg })
  hi("BlinkCmpLabelMatch", { fg = p.orange, bold = true })
  hi("BlinkCmpLabelDetail", { fg = p.fg_dim })
  hi("BlinkCmpLabelDescription", { fg = p.fg_dim })
  hi("BlinkCmpSource", { fg = p.fg_dark })
  hi("BlinkCmpGhostText", { fg = p.fg_dark, italic = true })
  hi("CmpItemMenu", { fg = p.fg_dark })
  hi("CmpGhostText", { fg = p.fg_dark, italic = true })
  hi("BlinkCmpKind", { fg = p.fg })
  hi("CmpItemKind", { fg = p.fg })
  for kind, color in pairs(kind_colors(p)) do
    hi("BlinkCmpKind" .. kind, { fg = color })
    hi("CmpItemKind" .. kind, { fg = color })
  end

  ----------------------------------------------------------------------------
  -- Other UI plugins
  ----------------------------------------------------------------------------
  hi("WhichKey", { fg = p.orange })
  hi("WhichKeyGroup", { fg = p.blue })
  hi("WhichKeyDesc", { fg = p.fg })
  hi("WhichKeySeparator", { fg = p.fg_dark })
  hi("WhichKeyTitle", { fg = p.teal })
  hi("WhichKeyBorder", { fg = p.fg_dark })
  hi("WhichKeyFloat", { fg = p.fg })
  hi("WhichKeyValue", { fg = p.fg_dim })

  hi("FlashMatch", { fg = p.fg, bg = p.bg_highlight })
  hi("FlashCurrent", { fg = p.bg, bg = p.orange, bold = true })
  hi("FlashLabel", { fg = p.bg, bg = p.salmon, bold = true })
  hi("FlashPrompt", { fg = p.fg })
  hi("FlashPromptPrefix", { fg = p.orange })
  hi("FlashBackdrop", { fg = p.fg_dark })

  hi("TroubleNormal", { fg = p.fg })
  hi("TroubleText", { fg = p.fg })
  hi("TroubleFile", { fg = p.blue })
  hi("TroubleSource", { fg = p.fg_dark })
  hi("TroubleCode", { fg = p.fg_dark })
  hi("TroubleCount", { fg = p.salmon, bold = true })
  hi("TroubleIndentGuide", { fg = p.bg_highlight })

  hi("BufferLineFill", { bg = p.bg })
  hi("BufferLineBuffer", { fg = p.fg_dim })
  hi("BufferLineBufferVisible", { fg = p.fg_dim })
  hi("BufferLineBufferSelected", { fg = p.fg_bright, bold = true })
  hi("BufferLineModified", { fg = p.salmon })
  hi("BufferLineModifiedVisible", { fg = p.salmon })
  hi("BufferLineModifiedSelected", { fg = p.salmon })
  hi("BufferLineDuplicate", { fg = p.fg_dark })
  hi("BufferLineDuplicateVisible", { fg = p.fg_dark })
  hi("BufferLineDuplicateSelected", { fg = p.fg_dark })
  hi("BufferLineIndicatorSelected", { fg = p.teal })
  hi("BufferLineSeparator", { fg = p.bg })
  hi("BufferLineSeparatorVisible", { fg = p.bg })
  hi("BufferLineSeparatorSelected", { fg = p.bg })
  hi("BufferLineCloseButton", { fg = p.fg_dark })
  hi("BufferLineCloseButtonVisible", { fg = p.fg_dark })
  hi("BufferLineCloseButtonSelected", { fg = p.red })
  hi("BufferLineTab", { fg = p.fg_dim })
  hi("BufferLineTabSelected", { fg = p.fg_bright, bold = true })
  hi("BufferLineTabClose", { fg = p.fg_dark })
  hi("BufferLinePick", { fg = p.orange, bold = true })
  hi("BufferLinePickSelected", { fg = p.orange, bold = true })
  hi("BufferLinePickVisible", { fg = p.orange, bold = true })
  hi("BufferLineOffsetSeparator", { fg = p.bg_highlight })

  hi("LazyNormal", { fg = p.fg })
  hi("LazyButton", { fg = p.fg, bg = p.bg_alt })
  hi("LazyButtonActive", { fg = p.bg, bg = p.teal, bold = true })
  hi("LazyH1", { fg = p.bg, bg = p.teal, bold = true })
  hi("LazyH2", { fg = p.orange, bold = true })
  hi("LazyComment", { fg = p.comment })
  hi("LazySpecial", { fg = p.blue })
  hi("LazyProgressDone", { fg = p.teal })
  hi("LazyProgressTodo", { fg = p.bg_alt })

  hi("MasonNormal", { fg = p.fg })
  hi("MasonHeader", { fg = p.bg, bg = p.teal, bold = true })
  hi("MasonHighlight", { fg = p.blue })
  hi("MasonHighlightBlock", { fg = p.bg, bg = p.blue })
  hi("MasonHighlightBlockBold", { fg = p.bg, bg = p.blue, bold = true })
  hi("MasonMuted", { fg = p.fg_dark })
  hi("MasonMutedBlock", { fg = p.fg_dark, bg = p.bg_alt })
  hi("MasonMutedBlockBold", { fg = p.fg, bg = p.bg_alt, bold = true })

  hi("debugPC", { bg = p.bg_alt })
  hi("DapBreakpoint", { fg = p.red })
  hi("DapBreakpointCondition", { fg = p.orange })
  hi("DapBreakpointRejected", { fg = p.fg_dark })
  hi("DapLogPoint", { fg = p.blue })
  hi("DapStopped", { fg = p.green })
end

function M.load()
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end
  vim.o.background = "dark"
  vim.g.colors_name = "gamemaker"

  apply(M.palette)

  -- Terminal colours, sampled from the GameMaker palette.
  vim.g.terminal_color_0 = "#1D1D1D"
  vim.g.terminal_color_1 = "#FF5555"
  vim.g.terminal_color_2 = "#58E55A"
  vim.g.terminal_color_3 = "#FFB871"
  vim.g.terminal_color_4 = "#40C3F4"
  vim.g.terminal_color_5 = "#CC9FFF"
  vim.g.terminal_color_6 = "#0B9B80"
  vim.g.terminal_color_7 = "#C0C0C0"
  vim.g.terminal_color_8 = "#696969"
  vim.g.terminal_color_9 = "#FF8080"
  vim.g.terminal_color_10 = "#A8FF8A"
  vim.g.terminal_color_11 = "#FFD9A0"
  vim.g.terminal_color_12 = "#8AD9FF"
  vim.g.terminal_color_13 = "#E5B8FF"
  vim.g.terminal_color_14 = "#6FE8CD"
  vim.g.terminal_color_15 = "#EEEEEE"
end

return M
