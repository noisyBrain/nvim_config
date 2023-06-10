local null_ls = SafeRequire("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier.with({
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote"
      }
    }),
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file('.eslintrc.js')
      end
    }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    formatting.mix,
    formatting.fixjson,
    formatting.sql_formatter,
    diagnostics.yamllint,
    diagnostics.pylint
	},
})
