local subdir = "user"
local config_files = {
  "options",
  "utils",
  "keymaps",
  "plugins",
  "onedark",
  "cmp",
  "mason_config",
  "telescope",
  "treesitter",
  "dap",
  "nvim_dap_ui",
  "toggleterm",
  "neorg",
  "noice",
  "autopairs",
  "comments",
  "neogit",
  "gitsigns",
  "nvim_tree",
  "lsp",
  "neotest",
  "feline_bar",
  "blankline",
  "mind",
  "todo_comment",
  "which_key",
  "surround",
  "colorizer",
  "prettier",
  "autoopen_ntree",
}

for _, file  in ipairs(config_files ) do
  require(subdir .. "." .. file)
end
