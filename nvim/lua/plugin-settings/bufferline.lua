vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        -- use nvim native nvim_lsp
        diagnostics = "nvim_lsp",

        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}
