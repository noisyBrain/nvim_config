local comment = SafeRequire("Comment")
comment.setup {
    padding = true,
    sticky = true,
    ignore = nil,

    toggler = { line = "gcc", block = "<Nop>" },
    opleader = { line = "gc", block = "<Nop>" },
    mappings = { basic = true, extra = true },

    extra = { above = 'gcO', below = 'gco', eol = 'gcA' },

    pre_hook = function(ctx)
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = 0 })

      if filetype == "javascriptreact" or filetype == "typescriptreact" then
        local ctx_ctype = ctx.ctype
        local type = ctx_ctype == require("Comment.utils").ctype.linewise and "__default" or "__multiline"
        local location = nil
        local ctx_cmotion = ctx.cmotion

        if ctx_ctype == require("Comment.utils").ctype.blockwise then
          location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif
          ctx_cmotion == require("Comment.utils").cmotion.v or ctx_cmotion == require("Comment.utils").cmotion.V
        then
          location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring({
          key = type,
          location = location,
        })
      end
    end,

    post_hook = nil,
}

