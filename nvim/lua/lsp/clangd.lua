require'lspconfig'.clangd.setup{
    settings = {
        clangd = {
            arguments = "-extra-arg=-std=c++17",
            checkUpdates = true,
        }
    },
}
