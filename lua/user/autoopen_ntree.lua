local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1
  local real_file = vim.fn.filereadable(data.file) == 1
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if real_file or no_name then
    local parent_dir = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
    vim.cmd.cd(parent_dir)
    vim.cmd.cd('../')
    require("nvim-tree.api").tree.open()
  end

  if directory then
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
  end

end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
