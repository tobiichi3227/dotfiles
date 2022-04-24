local util = require"lspconfig.util"
require'lspconfig'.gopls.setup{
    cmd = {"gopls", "serve"},
    filetype = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        analyses = {
            unusedparams = true,
        },
        staticcheck = true,
    },
}
