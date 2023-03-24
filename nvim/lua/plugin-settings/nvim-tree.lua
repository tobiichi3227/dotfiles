require'nvim-tree'.setup({
    actions = {
        open_file = {
            quit_on_open = true,
        }
    },

    git = {
        enable = false
    },

    diagnostics = {
        enable = false,
        icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
        },
    },

    view = {
        number = true,
        relativenumber = true,
        signcolumn = 'yes',
    },
})

