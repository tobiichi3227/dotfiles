" lua basic settings
lua require('basic')

" lua package load
lua require('plugins')
"
" keymap settings
lua require('keymaps')

" color theme settings


" plugins settings
" lua require('plugin-settings/which-key')
" lua require('plugin-settings/nvim-treesitter')
" lua require('plugin-settings/telescope')
" lua require('plugin-settings/nvim-autopair')
lua require('plugin-settings/nvim-tree')
lua require('plugin-settings/bufferline')
" lua require('plugin-settings/surround')
lua require('plugin-settings/comment')
lua require('plugin-settings/nvim-lualine')
lua require('plugin-settings/neoscroll')

" lsp settings
lua require('lsp/setup')
lua require('lsp/nvim-cmp')
" lua require('lsp/nvim-cmp-config')
" lua require('lsp/diagnostic_signs')
" lua require('lsp/language_servers')


let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set mouse=a

lua <<EOF
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.cmd[[colorscheme tokyonight]]
EOF

let g:rainbow_active = 1
let g:rainbow_load_separately = [
     \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
     \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
     \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
     \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
     \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
