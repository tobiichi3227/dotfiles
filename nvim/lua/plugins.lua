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

    -- nvim-tree --
    use {
        'kyazdani42/nvim-tree.lua',
        require = 'kyazdani42/nvim-web-devicons'
    }

    -- comment --
    use 'numToStr/Comment.nvim'

    -- bufferline --
    use {
        'akinsho/bufferline.nvim',
        require = 'kyazdani42/nvim-web-devicons'
    }

    -- nvim-autopairs --
    use 'windwp/nvim-autopairs'

    -- neoscroll --
    use 'karb94/neoscroll.nvim'

    -- vim-floaterm --
    use 'voldikss/vim-floaterm'

    -- vim-startuptime --
    -- use 'dstein64/vim-startuptime'

    -- surround --
    -- use 'blackCauldron7/surround.nvim'

    -- undotree --
    use 'mbbill/undotree'

    -- calendar
    use 'itchyny/calendar.vim'

    -- treesitter --
    -- use {
    --     'nvim-treesitter/nvim-treesitter',
    --     run = ':TSUpdate'
    -- }

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

    -- vsnip --
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    -- lspkind --
    use 'onsails/lspkind-nvim'


end)
