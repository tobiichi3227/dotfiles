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
lua require('plugin-settings/nvim-web-devicons')
lua require('plugin-settings/nvim-treesitter')
lua require('plugin-settings/spellsitter')
lua require('plugin-settings/telescope')
lua require('plugin-settings/nvim-autopairs')
lua require('plugin-settings/nvim-tree')
lua require('plugin-settings/bufferline')
" lua require('plugin-settings/surround')
lua require('plugin-settings/comment')
lua require('plugin-settings/todo-comments')
lua require('plugin-settings/nvim-lualine')
lua require('plugin-settings/neoscroll')
lua require('plugin-settings/indent-blankline')
lua require('plugin-settings/dashboard')
lua require('plugin-settings/gitsigns')
lua require('plugin-settings/nvim-scrollbar')
lua require('plugin-settings/vista')
lua require('plugin-settings/toggleterm')
lua require('plugin-settings/trouble')

" markdown

" lsp settings
lua require('lsp/setup')
lua require('lsp/nvim-cmp')
lua require('lsp/lsp-signature')
" lua require('lsp/nvim-cmp-config')
" lua require('lsp/diagnostic_signs')
" lua require('lsp/language_servers')


let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set mouse=a

" automatically open nvim-treesitter's highlight function
autocmd WinEnter,WinLeave * TSBufToggle highlight

" automatically clean the extra space at the end of the line when saving file
autocmd BufWritePre * :%s/\s\+$//e

lua <<EOF
vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_style = "day"
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

let g:mkdp_auto_start = 0
let g:mkdp_browser = ''
let g:mkdp_refresh_start = 1
