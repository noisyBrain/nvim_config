local subdir = "user"
local config_files = {
  "options",
  "utils",
  "keymaps",
  "plugins",
  "base46",
  "cmp",
  "mason_config",
  "telescope",
  "treesitter",
  "toggleterm",
  "neorg",
  "noice",
  "autopairs",
  "comments",
  "neogit",
  "gitsigns",
  "nvim_tree",
  "lsp",
  "feline_bar",
  "blankline",
  "which_key",
  "surround",
  "colorizer",
  "prettier",
  "autoopen_ntree"
}

for _, file  in ipairs(config_files ) do
  require(subdir .. "." .. file)
end
