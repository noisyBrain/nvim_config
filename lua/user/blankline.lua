local blankline = SafeRequire("indent_blankline")

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#00cc00 gui=nocombine]]


blankline.setup {
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
  show_trailing_blankline_indent = false
}
