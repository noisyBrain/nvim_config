local base46 = SafeRequire('base46')

base46.setup {
  theme = 'onedark',
  show_end_of_buffer = false,
}

vim.cmd[[colorscheme base46]]
