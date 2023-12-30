local configs = SafeRequire("nvim-treesitter.configs")

configs.setup({
	ensure_installed = { 'typescript', 'javascript', 'html', 'css', 'python', 'prisma', 'cpp', 'markdown', 'markdown_inline' }, -- one of "all" or a list of languages
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "" } },
  rainbow = {
    enable = true,
    query = "rainbow-delimiters",
    extended_mode = true,
    max_file_lines = nil,
  }
})
