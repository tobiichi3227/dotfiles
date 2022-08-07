" lua
" lua basic settings
lua require('basic')

" lua package load
lua require('plugins')
"
" keymap settings
lua require('keymaps')

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
" lua require('plugin-settings/go-nvim')

" lsp settings
lua require('lsp/setup')
lua require('lsp/nvim-cmp')
lua require('lsp/lsp-signature')
"lua end

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set mouse=a
set termguicolors
set lazyredraw
set foldmethod=manual
set title
set showmatch

" automatically open nvim-treesitter's highlight function
autocmd BufRead * TSBufToggle highlight

" automatically clean the extra space at the end of the line when saving file
autocmd BufWritePre * :%s/\s\+$//e

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


" tabout
func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        return "\<Esc>la"
    else
        return "\t"
    endif
endfunc

inoremap <silent> <TAB> <c-r>=SkipPair()<CR>

" parenthesis/bracket 驚豔到我的功能
vnoremap i) <esc>`>a)<esc>`<i(<esc>
vnoremap i] <esc>`>a]<esc>`<i[<esc>
vnoremap i} <esc>`>a}<esc>`<i{<esc>
vnoremap i" <esc>`>a"<esc>`<i"<esc>
vnoremap i' <esc>`>a'<esc>`<i'<esc>
vnoremap i` <esc>`>a`<esc>`<i`<esc>
vnoremap i> <esc>`>a><esc>`<i<<esc>

noremap <F1> <Esc>"

" F2 switch number for copy file
function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <silent> <F2> :call HideNumber()<CR>

" F4 switch wrap
nnoremap <silent> <F4> :set wrap! wrap?<CR>

set pastetoggle=<F5>
autocmd InsertLeave * set nopaste

" Map ; to : and save shift
nnoremap ; :

" like web browser to create new tab
nnoremap <silent> <C-t> :tabnew<CR>
inoremap <silent> <C-t> <Esc>:tabnew<CR>

" copy select section to system clipboard
vnoremap <leader>y "+y

nnoremap <leader>v V`}

lua <<EOF
vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_style = "day"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.cmd[[colorscheme tokyonight]]
EOF

hi Normal ctermbg=NONE
highlight NonText ctermbg=NONE
hi Normal guibg=NONE
" hi LineNr ctermbg=black
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

let g:rainbow_active = 1
let g:rainbow_load_separately = [
     \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
     \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
     \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
     \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
     \ ]
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

