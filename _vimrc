if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set nocompatible
set shiftwidth=4
set hls
set ts=4
syntax on
set cursorline
set t_Co=256
set number
set rnu
set noignorecase
set smartcase
set inc
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set backspace=2
set laststatus=2
set showcmd
set showmode
set mouse=a
set encoding=utf-8
set expandtab

let mapleader=","

" Quit insert mode
inoremap jj <ESC>

" Quit visual mode
vnoremap v <ESC>
vnoremap < <gv
vnoremap > >gv

" Move to the start of line
nnoremap H 0
vnoremap H 0

" Move to the end of line
nnoremap L $
vnoremap L $

nnoremap <leader>sc :nohlsearch<CR>
nnoremap <leader>h ^
nnoremap <leader>l g_