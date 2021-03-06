local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    size = 15,
    open_mapping = [[<c-\>]],
    hide_number = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

-- function _G.set_terminal_keymaps()
--     local opts = { noremap = true },
--     vim.api.nvim_buf_set_keymap(0, 't', '<esc>', '[[<C-\')
-- end

local terminal = require("toggleterm.terminal").Terminal

local htop = terminal:new({ cmd = "htop", hidden = true })
local lazygit = terminal:new({ cmd = "lazygit", hidden = true })

function _HTOP_TOGGLE()
    htop:toggle()
end

function _LAZYGIT_TOGGLE()
    lazygit:toggle()
end
