local blankline = SafeRequire("indent_blankline")

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#800be0 gui=nocombine]]


blankline.setup {
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
}
