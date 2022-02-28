if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    
    " colorscheme tokyonight


    " Plug 'jayli/vim-easycomplete'
    Plug 'jiangmiao/auto-pairs'
    
    " Plug 'ctrlpvim/ctrlp.vim'
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'

    " Plug 'vim-airline/vim-airline-themes', { 'as': 'airline-themes' }
    
    Plug 'preservim/tagbar'
    
    Plug 'vim-scripts/taglist.vim'
    
    Plug 'luochen1990/rainbow'
    

call plug#end()

