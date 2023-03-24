local rust_tools = require('rust-tools')

local dbg_path = require('dap-install.config.settings').options['installation_path'] .. 'codelldb/'
local codelldb_path = dbg_path .. 'extension/adapter/codelldb'
local liblldb_path = dbg_path .. 'extension/lldb/lib/liblldb.so'

local opts = {
    tools = { -- rust-tools options

        -- how to execute terminal commands
        -- options right now: termopen / quickfix
        executor = require("rust-tools.executors").termopen,

        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,

        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = true,

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },

        -- options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {

            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
                { "╭", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╮", "FloatBorder" },
                { "│", "FloatBorder" },
                { "╯", "FloatBorder" },
                { "─", "FloatBorder" },
                { "╰", "FloatBorder" },
                { "│", "FloatBorder" },
            },

            -- Maximal width of the hover window. Nil means no max.
            max_width = nil,

            -- Maximal height of the hover window. Nil means no max.
            max_height = nil,

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = false,
        },

        -- settings for showing the crate graph based on graphviz and the dot
        -- command
        crate_graph = {
            -- Backend used for displaying the graph
            -- see: https://graphviz.org/docs/outputs/
            -- default: x11
            backend = "x11",
            -- where to store the output, nil for no output stored (relative
            -- path from pwd)
            -- default: nil
            output = nil,
            -- true for all crates.io and external crates, false only the local
            -- crates
            -- default: true
            full = true,

            -- List of backends found on: https://graphviz.org/docs/outputs/
            -- Is used for input validation and autocompletion
            -- Last updated: 2021-08-26
            enabled_graphviz_backends = {
                "bmp",
                "cgimage",
                "canon",
                "dot",
                "gv",
                "xdot",
                "xdot1.2",
                "xdot1.4",
                "eps",
                "exr",
                "fig",
                "gd",
                "gd2",
                "gif",
                "gtk",
                "ico",
                "cmap",
                "ismap",
                "imap",
                "cmapx",
                "imap_np",
                "cmapx_np",
                "jpg",
                "jpeg",
                "jpe",
                "jp2",
                "json",
                "json0",
                "dot_json",
                "xdot_json",
                "pdf",
                "pic",
                "pct",
                "pict",
                "plain",
                "plain-ext",
                "png",
                "pov",
                "ps",
                "ps2",
                "psd",
                "sgi",
                "svg",
                "svgz",
                "tga",
                "tiff",
"tif",
                "tk",
                "vml",
                "vmlz",
                "wbmp",
                "webp",
                "xlib",
                "x11",
            },
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
        on_attach = function (_, bufnr)
            vim.keymap.set('n', '<leader>ha', rust_tools.hover_actions.hover_actions, {buffer=bufnr})
            -- vim.keymap.set('n', '<leader>ca', rust_tools.code_action_group.code_action_group, {buffer=bufnr})
        end
    }, -- rust-analyzer options

    -- dap = {
    --     adapter = {
    --         rust_tools.dap.get_codelldb_adapter(codelldb_path, liblldb_path)
    --     }
    -- }
}

rust_tools.setup(opts)

-- enable inlay hints
rust_tools.inlay_hints.enable()

vim.cmd(
"command! RustSetInlayHints :lua require('rust-tools.inlay_hints').set_inlay_hints()"
)
vim.cmd(
"command! RustDisableInlayHints :lua require('rust-tools.inlay_hints').disable_inlay_hints()"
)
vim.cmd(
"command! RustToggleInlayHints :lua require('rust-tools.inlay_hints').toggle_inlay_hints()"
)
vim.cmd(
"command! RustExpandMacro :lua require('rust-tools.expand_macro').expand_macro()"
)
vim.cmd(
"command! RustJoinLines :lua require('rust-tools.join_lines').join_lines()"
)
vim.cmd(
"command! RustHoverActions :lua require('rust-tools.hover_actions').hover_actions()"
)
vim.cmd(
"command! RustMoveItemDown :lua require('rust-tools.move_item').move_item()"
)
vim.cmd(
"command! RustMoveItemUp :lua require('rust-tools.move_item').move_item(true)"
)
