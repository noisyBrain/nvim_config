local mason = SafeRequire("mason")
local mason_config = SafeRequire("mason-lspconfig")

local servers = {
  "marksman",
  "emmet_ls",
  "jsonls",
  "yamlls",
  "lua_ls",
  "tsserver",
  "clangd"
}

mason.setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

mason_config.setup {
  ensure_installed = servers,
}

require("lspconfig").lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}

require("lspconfig").tsserver.setup {}
require("lspconfig").pylsp.setup {}
require("lspconfig").prismals.setup {}
require('lspconfig').clangd.setup {}
