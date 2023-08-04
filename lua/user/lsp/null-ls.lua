local null_ls = SafeRequire("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" }
    }),
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file(".eslintrc.json")
      end
    }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    formatting.mix,
    formatting.fixjson,
    formatting.sql_formatter,
    diagnostics.yamllint,
    -- diagnostics.pylint
	},
})
