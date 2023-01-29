local subdir = "user"
local config_files = {
  "options",
  "utils",
  "keymaps",
  "plugins",
  "tokyonight",
  "cmp",
  "mason_config",
  "telescope",
  "treesitter",
  "autopairs",
  "comments",
  "tmux",
  "neogit",
  "dashboard",
  "gitsigns",
  "nvim_tree",
  "bufferline",
  "feline_bar",
  "lsp",
  "wich_key",
  "surround",
  "litee",
  "gh",
  "harpoon",
}

for _ , file  in ipairs(config_files ) do
  require(subdir .. "." .. file)
end
