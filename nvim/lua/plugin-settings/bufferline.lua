vim.opt.termguicolors = true
require("bufferline").setup {
    options = {

        name_formatter = function (buf)
            if buf.name:match("%d.md") then
                return vim.fn.fnamemodify(buf.name, ":t:r")
            end
        end,

        indicator_icon = "",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",

        -- use nvim native nvim_lsp
        diagnostics = "nvim_lsp",

        diagnostics_indicator = function (count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,

        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
        show_buffer_close_icons = true,
        show_buffer_icons = true,
        separator_style = "thin",
    }
}
