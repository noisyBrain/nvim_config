local mason = SafeRequire("mason")
local mason_config = SafeRequire("mason-lspconfig")

local lspconfig = SafeRequire("lspconfig")
local on_attach = SafeRequire("lspconfig").on_attach
local capabilities = SafeRequire("lspconfig").capabilities
local util = SafeRequire("lspconfig/util")

local servers = {
  "marksman",
  "emmet_ls",
  "jsonls",
  "lua_ls",
  "tsserver",
  "bashls",
  "gopls"
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

lspconfig.lua_ls.setup {
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

lspconfig.gopls.setup {
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    completeUnImported = true,
    usePlaceholders = true,
    analyses = {
      unusedparams = true
    }
  }
}
lspconfig.tsserver.setup {}
lspconfig.pyright.setup {}
lspconfig.prismals.setup {}
lspconfig.astro.setup {}
