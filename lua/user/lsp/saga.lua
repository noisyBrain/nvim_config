local saga = SafeRequire( "lspsaga")

saga.setup {
  diagnostic = {
    on_insert = false
  },

  ui = {
    title = true,
    border = "rounded",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },
}

