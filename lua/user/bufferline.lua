local buf = SafeRequire("bufferline")

buf.setup {
        options = {
            mode = "buffers", -- can also be set to "tabs" to see tabpages
            themable = false,-- whether or not the highlights for this plugin can be overriden.
            numbers = "both",
            close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
            right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
            buffer_close_icon= "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            --- name_formatter can be used to change the buffer's label in the bufferline.
            --- Please note some names can/will break the
            --- bufferline so use this at your discretion knowing that it has
            --- some limitations that will NOT be fixed.
            name_formatter = function(buffer)  -- buf contains a "name", "path" and "bufnr"
              -- remove extension from markdown files for example
              if buffer.name:match('%.md') then
                return vim.fn.fnamemodify(buffer.name, ':t:r')
              end
            end,
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is deduplicated
            tab_size = 18,
            diagnostics =  "nvim_lsp",
            diagnostics_indicator = function(count, _)
              return "("..count..")"
            end,
            show_buffer_icons = true ,
            show_buffer_close_icons = true,
            show_buffer_default_icon = true,
            show_close_icon =  false,
            show_tab_indicators = true,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { "|", "|" }
            separator_style = "slant" ,
            -- separator_style = "slant" | "padded_slant" | "thick" | "thin" | { "any", "any" },
            enforce_regular_tabs = false ,
            always_show_bufferline = true,
            offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "left"}},
            sort_by =  "extension" ,
            -- sort_by = "id" | "extension" | "relative_directory" | "directory" | "tabs" | function(buffer_a, buffer_b)
            -- add custom logic
                -- return buffer_a.modified > buffer_b.modified
            -- end
        }
}

-- local buf = SafeRequire("bufferline")
--
-- local nord0 = "#2E3440"
-- local nord1 = "#3B4252"
-- local nord9 = "#81A1C1"
-- local fill = nord0 --'#181c24' if separator_style is "slant"
-- local indicator = nord9
-- local bg = nord0
-- local buffer_bg = nord0
-- local buffer_bg_selected = nord1
-- local buffer_bg_visible = "#2A2F3A"
--
-- buf.setup({
--  highlights = {
--   fill = {
--    bg = fill
--   },
--   background = {
--    bg = bg,
--   },
--
--   buffer_selected = {
--    bg = buffer_bg_selected,
--   },
--   buffer_visible = {
--    bg = buffer_bg_visible,
--    italic = true
--   },
--
--   numbers = {
--    bg = buffer_bg,
--   },
--   numbers_selected = {
--    bg = buffer_bg_selected,
--   },
--   numbers_visible = {
--    bg = buffer_bg_visible,
--    italic = true
--   },
--
--   diagnostic = {
--    bg = buffer_bg,
--   },
--   diagnostic_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--   diagnostic_visible = {
--    bg = buffer_bg_visible
--   },
--
--   hint = {
--    bg = buffer_bg,
--   },
--   hint_visible = {
--    bg = buffer_bg_visible,
--   },
--   hint_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--   hint_diagnostic = {
--    bg = buffer_bg,
--   },
--   hint_diagnostic_visible = {
--    bg = buffer_bg_visible,
--   },
--   hint_diagnostic_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--
--   info = {
--    bg = buffer_bg;
--   },
--   info_visible = {
--    bg = buffer_bg_visible,
--   },
--   info_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--   info_diagnostic = {
--    bg = buffer_bg,
--   },
--   info_diagnostic_visible = {
--    bg = buffer_bg_visible,
--   },
--   info_diagnostic_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--
--   warning = {
--    bg = buffer_bg,
--   },
--   warning_visible = {
--    bg = buffer_bg_visible,
--   },
--   warning_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--   warning_diagnostic = {
--    bg = buffer_bg,
--   },
--   warning_diagnostic_visible = {
--    bg = buffer_bg_visible,
--   },
--   warning_diagnostic_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--   error = {
--    bg = buffer_bg,
--   },
--   error_visible = {
--    bg = buffer_bg_visible,
--   },
--   error_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--   error_diagnostic = {
--    bg = buffer_bg,
--   },
--   error_diagnostic_visible = {
--    bg = buffer_bg_visible,
--   },
--   error_diagnostic_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--
--   close_button = {
--    bg = buffer_bg,
--   },
--   close_button_visible = {
--    bg = buffer_bg_visible,
--   },
--   close_button_selected = {
--    bg = buffer_bg_selected,
--   },
--
--   duplicate = {
--    bg = buffer_bg,
--   },
--   duplicate_selected = {
--    bg = buffer_bg_selected,
--   },
--   duplicate_visible = {
--    bg = buffer_bg_visible,
--   },
--
--   separator = {
--    fg = fill,
--    bg = buffer_bg,
--   },
--   separator_selected = {
--    fg = fill,
--    bg = buffer_bg_selected,
--   },
--   separator_visible = {
--    fg = fill,
--    bg = buffer_bg_visible,
--   },
--   modified = {
--    bg = buffer_bg,
--   },
--   modified_selected = {
--    bg = buffer_bg_selected,
--   },
--   modified_visible = {
--    bg = buffer_bg_visible,
--   },
--   indicator_selected = {
--    fg = indicator,
--    bg = buffer_bg_selected,
--   },
--   pick = {
--    bg = buffer_bg,
--    bold = true,
--    italic = true,
--   },
--   pick_selected = {
--    bg = buffer_bg_selected,
--    bold = true,
--    italic = true,
--   },
--   pick_visible = {
--    bg = buffer_bg_visible,
--    bold = true,
--    italic = true,
--   },
--  },
-- })
