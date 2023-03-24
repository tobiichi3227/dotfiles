local util = require('lspconfig.util')
local navic = require('nvim-navic')

require("mason").setup({

})

require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "jsonls",
        "lua_ls",
        "pyright",
        "yamlls",
        "asm_lsp",
        "rust_analyzer",
    },
})

-- lua
local opts = { noremap=true, silent=true }

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_defintion, bufopts)
    vim.keymap.set('n', '<leader>ca', ':CodeActionMenu<CR>', bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>=', function() vim.lsp.buf.format {async=true} end, bufopts)

    vim.keymap.set('n', 'go', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, bufopts)

    -- navic setup
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local lsg_flags = {

}

-- bashls
require('lspconfig')['bashls'].setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

-- clangd
require('lspconfig')['clangd'].setup({
    on_attach = on_attach,
    flags = lsp_flags,

    settings = {
        clangd = {
            arguments = "-extra-arg=-std=c++17",
            checkUpdates = true,
        },
    },
})

-- sumneko_lua
require('lspconfig')['lua_ls'].setup({
    on_attach = on_attach,
    flags = lsp_flags,

    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- pyright
require('lspconfig')['pyright'].setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

-- yamlls
require('lspconfig')['yamlls'].setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

-- jsonls
require('lspconfig')['jsonls'].setup({
    on_attach = on_attach,
    flags = lsp_flags,
})

require('lspconfig')['asm_lsp'].setup({
    on_attach = on_attach,
    flags = lsp_flags,

    settings = {
        root_dir = util.find_git_ancestor()
    }
})

require('lspconfig')['rust_analyzer'].setup({
    on_attach = on_attach,
    flags = lsp_flags,
    -- settings = {
    --     root_dir = util.root_pattern('Cargo.toml', 'rust-project.json'),
    --     ['rust_analyzer'] = {
    --         diagnostics = {
    --             enable = false,
    --         }
    --     }
    -- }
})
