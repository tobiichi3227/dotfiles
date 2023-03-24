" lua

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
lua require('plugin-settings/rust-tools')
" lua require('plugin-settings/go-nvim')
lua require('plugin-settings/dressing')
lua require('plugin-settings/persistence')
lua require('plugin-settings/bigfile')

" lsp settings
lua require('lsp/setup')
lua require('lsp/nvim-cmp')
lua require('lsp/lsp-signature')
lua require('lsp/nvim-navic')

" dap settings
lua require('dap/dap-config').setup()

" lua basic settings
lua require('basic').setup()

" lua package load
lua require('plugins')
"
" keymap settings
lua require('keymaps')

"lua end

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set mouse=a
set termguicolors
set lazyredraw
set foldmethod=manual
set title
set showmatch
set t_Co=256
syntax on
filetype plugin on
set nocompatible

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

" set pastetoggle=<F5>
" autocmd InsertLeave * set nopaste

" Map ; to : and save shift
nnoremap ; :

nnoremap <leader>v V`}

lua <<EOF
vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_style = "day"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- vim.cmd[[colorscheme tokyonight]]
EOF
colorscheme tokyonight-night

" hi Normal ctermbg=NONE
" highlight NonText ctermbg=NONE
" hi Normal guibg=NONE
" hi LineNr ctermbg=black
" hi LineNr term=bold ctermfg=DarkGrey
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

" vimwiki store path
let g:vimwiki_list = [{'path':'/home/tobiichi3227/vimwiki/personal'}, {'path':'/home/tobiichi3227/vimwiki/work'}]
let g:vimwiki_listsyms = ' ○◐●✓'
let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'go': 'golang', 'rust': 'rust', 'java': 'java'}
hi VimwikiHeader1 guifg=#D79921
hi VimwikiHeader2 guifg=#689D6A
hi VimwikiHeader3 guifg=#B16286
hi VimwikiHeader4 guifg=#98971A
hi VimwikiHeader5 guifg=#458588
hi VimwikiHeader6 guifg=#CC241D
function! VimwikiLinkHandler(link)
    let link = a:link
    let link_mode = -1
    " mode 0 -> vfile # use vim edit file
    " mode 1 -> wikifile # use vim edit wiki file
    " mode 2 -> inp # use inprivate
    if link =~# '^vfile:'
        let link = link[1:]
        let link_mode = 0
    elseif link =~# '^wikifile:'
        let link = link[9:]
        let link_mode = 1
    elseif link =~# '^inp:'
        let link = link[4:]
        let link_mode = 2
    else
        return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
        echomsg 'Vimwiki Error: Unable to resolve link!!!'
        return 0
    else
        if link_mode == 0
            exe 'tabnew ' . fnameescape(link_infos.filename)
        elseif link_mode == 1
            exe 'tabnew ' . '/home/tobiichi3227/vimwiki/' . link . '.wiki'
        elseif link_mode == 2
            try
                let broswer = 'microsoft-edge-stable --inprivate '
                exe 'silent !' . broswer . link
            catch
                echomsg 'error'
            endtry
        endif
        return 1
    endif
endfunction
