require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "lua", "python", "java" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

vim.wo.foldlevel = 99
