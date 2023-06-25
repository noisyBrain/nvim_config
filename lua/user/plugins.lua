local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Use dependency and run lua function after load
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

 -- themes
  use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'
  use 'catppuccin/nvim'
  use 'noisyBrain/base46'

  -- Lua
  use { "folke/zen-mode.nvim" }

  -- autopairs
  use { "windwp/nvim-autopairs" }

  -- Markdown previewer
  use(
    { "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown", "md" } end,
      ft = { "markdown" },
    })

  -- cmp plugins
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin , commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a"
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions , commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323"
  use({ "hrsh7th/cmp-path" }) -- path completions , commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e"
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions , commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36"
  use({ "hrsh7th/cmp-nvim-lsp" }) -- , commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8"
  use({ "hrsh7th/cmp-nvim-lua" }) -- , commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21"
  use({ "hrsh7th/cmp-cmdline" })
  use({ "glepnir/lspsaga.nvim" }) -- commit = "c39cafb10867357ef7004c60b914db448977a531"

	-- snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- commit = "d27a83a363e61009278b6598703a763ce9c8e617"

  --Lsp Stuff
  use({ "williamboman/mason.nvim", requires = { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" } })
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- for formatters and linters

  -- Telescope
  use({ "nvim-telescope/telescope.nvim", commit = "d96eaa914aab6cfc4adccb34af421bdd496468b0" })
  use({ "nvim-telescope/telescope-ui-select.nvim" })
  use({ "nvim-telescope/telescope-media-files.nvim" })
  use({ "xiyaowong/telescope-emoji.nvim" })
  use({ "nvim-lua/popup.nvim" })

  -- Treesitter
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  -- UI
  use({ "stevearc/dressing.nvim" })
  use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim" } })
  use({ "lukas-reineke/indent-blankline.nvim"})

  -- Colorizer
  use({ "norcalli/nvim-colorizer.lua" })

    -- nvim-comments
  use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" })

  -- Prettier
  use({ 'MunifTanjim/prettier.nvim' })

  -- Neotest
  use {
  "nvim-neotest/neotest",
  requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      {"haydenmeade/neotest-jest", ft={"javascript","typescript"}},
      { "nvim-neotest/neotest-python", ft="python" },
      {"nvim-neotest/neotest-vim-test", requires = "vim-test/vim-test"}, -- Suport many test runners
    }}

  -- Neogit
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' }

  -- Nvim Tree
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons'}}

  -- Bufferline 
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- feline bar
  use { 'feline-nvim/feline.nvim', branch = '0.5-compat' }

  -- which key
  use { "folke/which-key.nvim" } -- bd4411a2ed4dd8bb69c125e339d837028a6eea71

  -- nvim-surround
  use({ "kylechui/nvim-surround"})

  -- Auto-save the file when change to Normal mode
  use {"Pocco81/auto-save.nvim" }

  -- Productivity
  use { "nvim-neorg/neorg", run = ':Neorg sync-parsers', requires = 'nvim-lua/plenary.nvim' }
  use {"akinsho/toggleterm.nvim", tag = '*' }

  if PACKER_BOOTSTRAP  then
    require("packer").PackerSync()
  end

end)
