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
  "autopairs",
  "comments",
  "tmux",
  "neogit",
  "gitsigns",
  "nvim_tree",
  "bufferline",
  "lsp",
  "feline_bar",
  "which_key",
  "surround",
  "colorizer",
  "gh",
  "harpoon",
  "prettier",
  "autoopen_ntree"
}

for _, file  in ipairs(config_files ) do
  require(subdir .. "." .. file)
end
