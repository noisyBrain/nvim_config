local subdir = "user"
local config_files = {
  "options",
  "utils",
  "keymaps",
  "plugins",
  -- "onedark",
  "catppuccin",
  "cmp",
  "mason_config",
  "telescope",
  "treesitter",
  "noice",
  "autopairs",
  "comments",
  "tmux",
  "neogit",
  "gitsigns",
  "nvim_tree",
  -- "bufferline",
  "lsp",
  "feline_bar",
  "blankline",
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
