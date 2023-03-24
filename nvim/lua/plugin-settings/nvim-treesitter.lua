require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "lua", "python", "java", "go", "rust", "toml" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extend_mode = true,
        max_file_lines = nil,
    }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

vim.wo.foldlevel = 99
