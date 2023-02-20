local mason = SafeRequire("mason")
local mason_config = SafeRequire("mason-lspconfig")


local servers = {
  "marksman",
  "emmet_ls",
  "jsonls",
  "yamlls",
  "lua_ls",
  "tsserver",
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
      runtime = {
        version = "Lua 5.3",
        path = {
          '?.lua',
          '?/init.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
          '/usr/share/5.3/?.lua',
          '/usr/share/lua/5.3/?/init.lua'
        }
      },
      workspace = {
        library = {
          vim.fn.expand'~/.luarocks/share/lua/5.3',
          '/usr/share/lua/5.3'
        }
      }
    }
  }
}

local group = vim.api.nvim_create_augroup("MasonLspGroup", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = group,
  pattern = {"*.js", "*.ts"},
  callback = function ()
    require("lspconfig").tsserver.setup {}
  end
})
