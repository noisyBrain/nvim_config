local blankline = SafeRequire("indent_blankline")


-- setup different colours for blankline example:

--vim.opt.termguicolors = true -> Enables 24-bit RGB color in the |TUI|.  Uses "gui" |:highlight|
                               -- 	attributes instead of "cterm" attributes. |guifg|
                               -- 	Requires an ISO-8613-3 compatible terminal.

-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#00cc00 gui=nocombine]] -> setup gui foreground to display indent line

-- blankline.setup {
  -- char_highlight_list = {
  --   "IndentBlanklineIndent1",
  -- },
  -- show_trailing_blankline_indent = false
-- }

blankline.setup {
  show_trailing_blankline_indent = false
}
