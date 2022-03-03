return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'


    -- plugins --

    -- tokyonight color themes --
    use 'folke/tokyonight.nvim'

    -- nvim-lualine --
    use { 'nvim-lualine/lualine.nvim',
        require = { 'kyazdani42/nvim-web-devicons' }
    }

    -- rainbow --
    use 'luochen1990/rainbow'

    -- nvim-cursorline --
    use 'yamatsum/nvim-cursorline'

    -- dashboard --
    use 'glepnir/dashboard-nvim'

    -- vim-devicons --
    use 'ryanoasis/vim-devicons'

    -- nvim-tree --
    use {
        'kyazdani42/nvim-tree.lua',
        require = 'kyazdani42/nvim-web-devicons'
    }

    -- comment --
    use 'numToStr/Comment.nvim'

    -- todo-comment --
    use {
        'folke/todo-comments.nvim',
        require = 'nvim-lua/plenary.nvim'
    }

    -- bufferline --
    use {
        'akinsho/bufferline.nvim',
        require = 'kyazdani42/nvim-web-devicons'
    }

    -- nvim-autopairs --
    use 'windwp/nvim-autopairs'

    -- neoscroll --
    use 'karb94/neoscroll.nvim'

    -- nvim-scrollbar --
    use 'petertriho/nvim-scrollbar'

    -- vim-floaterm --
    use 'voldikss/vim-floaterm'

    -- vim-startuptime --
    -- use 'dstein64/vim-startuptime'

    -- surround --
    -- use 'blackCauldron7/surround.nvim'

    -- undotree --
    use 'mbbill/undotree'

    -- calendar --
    use 'itchyny/calendar.vim'

    -- indent-blankline --
    use 'lukas-reineke/indent-blankline.nvim'

    -- gitsigns --
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- treesitter --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- spellsitter --
    use 'lewis6991/spellsitter.nvim'

    -- autopairs --
    -- use 'jiangmiao/auto-pairs'

    -- tagbar --
    use 'preservim/tagbar'

    -- vista --
    use 'liuchengxu/vista.vim'

    -- lsp config --
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer'
    }

    -- nvim-cmp --
    use 'hrsh7th/cmp-nvim-lsp' --nvim_lsp
    use 'hrsh7th/cmp-buffer' --buffer
    use 'hrsh7th/cmp-path' --path
    use 'hrsh7th/cmp-cmdline' --cmdline
    use 'hrsh7th/nvim-cmp'
    use 'ray-x/lsp_signature.nvim'
    use 'lukas-reineke/cmp-under-comparator'


    -- vsnip --
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    -- lspkind --
    use 'onsails/lspkind-nvim'


end)
