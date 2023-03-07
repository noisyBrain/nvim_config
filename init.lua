local subdir = "user"
local config_files = {
  "options",
  "utils",
  "keymaps",
  "plugins",
  "catppuccin",
  "cmp",
  "mason_config",
  "telescope",
  "treesitter",
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
