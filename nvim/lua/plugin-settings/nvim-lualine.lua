local diagnostics = {
   "diagnostics",
   sources = { "nvim_diagnostic" },
   sections = { "error", "warn" },
   symbols = { error = " ", warn = " " },
   colored = false,
   update_in_insert = false,
   always_visible = true,
}

local navic = require('nvim-navic')

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {"alpha", "dashboard", "NvimTree"},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {},

    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {'filename'},
            {
                function () return navic.get_location () end,
                cond = function () return navic.is_available () end,
            },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },

    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
}
