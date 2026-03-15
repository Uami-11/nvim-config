return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    enable_bracket_in_quote = true, -- Ensures brackets are paired inside quotes
    enable_afterquote = true, -- Adds bracket pairs after quotes
  },
}
